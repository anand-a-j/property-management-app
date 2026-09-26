Flutter BLoC ↔ UI Binding Skill
Purpose

Use this skill when a Flutter project already has BLoC/Cubit business logic and state classes, but the UI is missing or only partially connected to them.

The job is to bind the existing BLoC to the existing UI — not redesign the BLoC, repository, API, state model, or architecture, unless the existing code makes binding impossible.

The bound UI should handle: loading, success, error/failed, empty/not-found (when the state model supports it), form validation, submit actions, button loading state, one-time side effects, error messages, post-success navigation, initial data loading, retry, pull-to-refresh, and rebuild optimization.

Core Rule

Treat the existing BLoC and state classes as the source of truth. Before touching UI code:

Inspect the BLoC's events and every state class.
Identify the exact loading, success, failure, empty, and initial states — and the data/error fields each success/failure state exposes.
Identify which event to dispatch for: initial fetch, submit, retry, refresh, delete/update/etc.
Only then bind the UI, using those exact names. Never invent new state or event names when suitable ones already exist, and never replace a project's real states (e.g. ExampleLoading / ExampleSuccess / ExampleFailed / ExampleNotFound) with a generic imagined model (Loading / Loaded / Error).
1. Choosing a BLoC Widget
Widget	Responsibility
BlocBuilder	Render UI from state: loading indicator, content, empty state, error screen. Never trigger side effects here.
BlocListener	One-time side effects: navigation, snackbar, dialog, toast. Never render UI here.
BlocConsumer	Only when one UI section genuinely needs both rendering and a side effect. Prefer separate BlocBuilder + BlocListener when that's clearer.
dart
// Rendering
BlocBuilder<ExampleBloc, ExampleState>(
  builder: (context, state) {
    if (state is ExampleLoading) return const PageLoadingIndicator();
    if (state is ExampleSuccess) return ExampleContent(data: state.data);
    if (state is ExampleFailed) {
      return ExampleError(
        message: state.message,
        onRetry: () => context.read<ExampleBloc>().add(FetchExample()),
      );
    }
    return const SizedBox.shrink();
  },
)

// Side effects
BlocListener<ExampleBloc, ExampleState>(
  listener: (context, state) {
    if (state is ExampleSuccess) ExampleDetailsRoute(id: state.id).push(context);
    if (state is ExampleFailed) Snack.error(state.message);
  },
  child: ...,
)
2. Screen State → UI Mapping
BLoC state	UI
Initial	Placeholder if needed
Loading	Full-page loading
Success (non-empty)	Actual content
Success (empty) / NotFound	Empty state
Failed	Error widget + retry

Match widgets to the project's existing design system rather than inventing new ones. Don't treat an empty successful result as a failure — if the BLoC has a dedicated Empty/NotFound state, use it; otherwise check state.data.isEmpty inside the success branch.

3. Initial Data Fetch

Dispatch the fetch event once, in initState, not in build() (which can run many times and re-trigger the request):

dart
@override
void initState() {
  super.initState();
  context.read<ExampleBloc>().add(FetchExample());
}

If the event needs values from BuildContext, route arguments, or other runtime dependencies unavailable in initState, use the appropriate later lifecycle point instead — never build().

4. Pull-to-Refresh

Reuse the same fetch event; don't add new repository/API logic in the UI:

dart
RefreshIndicator(
  onRefresh: () async => context.read<ExampleBloc>().add(FetchExample()),
  child: ...,
)

Preserve already-visible content during a refresh where the state model supports it — don't force a full-page loader over existing data just because a refresh started.

5. Forms

Split state cleanly:

Local UI state (stays in the widget): TextEditingControllers, validation, focus, visibility toggles, other transient input.
Server/business state (stays in the BLoC): request loading, success, failure, API validation errors, the created/updated entity.

Validate locally first; only dispatch the BLoC event if validation passes:

dart
void _submit() {
  FocusScope.of(context).unfocus();
  if (!(_formKey.currentState?.validate() ?? false)) return;
  context.read<ExampleBloc>().add(SubmitExample(name: _nameController.text.trim()));
}
6. Submit Button Loading

Derive loading from the BLoC — never keep a separate local isLoading bool or manually flip it before/after dispatch. BLoC state is the single source of truth:

dart
ExampleButton(
  isLoading: context.select<ExampleBloc, bool>((bloc) => bloc.state is ExampleSubmitLoading),
  onTap: _submit,
)
7. Submit Success / Failure

Both are side effects, so both belong in BlocListener, never BlocBuilder:

dart
BlocListener<ExampleBloc, ExampleState>(
  listener: (context, state) {
    if (state is ExampleSubmitSuccess) ExampleSuccessRoute().push(context);
    if (state is ExampleSubmitFailed) Snack.error(state.message);
  },
  child: ExampleForm(),
)

Distinguish by how the error should present:

Transient (login failed, save failed, delete failed) → BlocListener → snackbar/dialog/toast.
Persistent screen-level (failed to load profile/products/terms) → BlocBuilder → error UI + retry.
8. Combining Listener + Builder
dart
return BlocListener<ExampleBloc, ExampleState>(
  listener: (context, state) {
    if (state is ExampleSubmitSuccess) ExampleDetailsRoute(id: state.id).push(context);
    if (state is ExampleSubmitFailed) Snack.error(state.message);
  },
  child: Scaffold(
    body: BlocBuilder<ExampleBloc, ExampleState>(
      builder: (context, state) {
        if (state is ExampleSubmitLoading) return const PageLoadingIndicator();
        if (state is ExampleSuccess) return ExampleContent(data: state.data);
        return const SizedBox.shrink();
      },
    ),
  ),
);

For complex screens, use separate builders per UI section rather than one giant conditional tree.

9. Navigation & Mounted Safety

Navigation only ever happens from a BlocListener, never a BlocBuilder (a rebuild can fire more than once and cause repeated navigation). When the listener does anything async-adjacent (navigation, dialogs), guard with context.mounted:

dart
listener: (context, state) {
  if (state is ExampleSuccess) {
    if (!context.mounted) return;
    ExampleRoute().push(context);
  }
}

Follow the project's existing routing conventions.

10. Avoiding Duplicate Side Effects

A state can be emitted more than once — never perform a side effect (dialog, navigation, snackbar) from inside BlocBuilder's builder. Always route side effects through BlocListener's listener.

11. Retry

Retry dispatches the same event that originally loaded the data — never a duplicated repository/API call inline in the screen:

dart
ExampleErrorWidget(
  message: state.message,
  onTap: () => context.read<ExampleBloc>().add(FetchExample()),
)
12. context.read vs context.select
context.read<T>() — dispatch an event or access the bloc without subscribing to rebuilds.
context.select<T, R>(...) — rebuild only when a small derived property (e.g. state is SubmitLoading) changes, avoiding rebuilds on unrelated state changes.
13. Don't Over-Bind

Don't wrap every individual widget (Text, Icon, Button, Container) in its own BlocBuilder. Identify the smallest meaningful region that actually depends on state:

Screen
 ├── AppBar (static)
 ├── Static content
 ├── BlocBuilder → dynamic content
 └── Submit button
      └── context.select → loading only
14. Preserve Existing UI

Keep the existing layout, widgets, styling, routes, validation, and controllers. Add only the BLoC wiring that's missing. This is a binding task, not a redesign — don't rewrite a screen just to make binding more convenient, and don't move business logic into the UI to simplify wiring.

15. Templates
Read-only screen
dart
class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});
  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ExampleBloc>().add(FetchExample());
  }

  void _retry() => context.read<ExampleBloc>().add(FetchExample());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => context.read<ExampleBloc>().add(FetchExample()),
        child: BlocBuilder<ExampleBloc, ExampleState>(
          builder: (context, state) {
            if (state is ExampleLoading) return const PageLoadingIndicator();
            if (state is ExampleSuccess) {
              if (state.data.isEmpty) {
                return const EmptyStateView(title: 'No data found');
              }
              return ExampleContent(data: state.data);
            }
            if (state is ExampleFailed) {
              return ExampleErrorWidget(message: state.message, onTap: _retry);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
Form screen
dart
class ExampleFormScreen extends StatefulWidget {
  const ExampleFormScreen({super.key});
  @override
  State<ExampleFormScreen> createState() => _ExampleFormScreenState();
}

class _ExampleFormScreenState extends State<ExampleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<ExampleBloc>().add(SubmitExample(name: _nameController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExampleBloc, ExampleState>(
      listener: (context, state) {
        if (state is ExampleSubmitSuccess) ExampleSuccessRoute().push(context);
        if (state is ExampleSubmitFailed) Snack.error(state.message);
      },
      child: Scaffold(
        body: Form(key: _formKey, child: /* fields */ const SizedBox()),
        bottomNavigationBar: ExampleButton(
          isLoading: context.select<ExampleBloc, bool>(
            (bloc) => bloc.state is ExampleSubmitLoading,
          ),
          onTap: _submit,
        ),
      ),
    );
  }
}
16. Multiple Operations in One Screen

When a single BLoC handles several operations (e.g. FetchProfile, UpdateProfile, DeleteProfile), each has its own loading/success/failure states — map each independently rather than assuming every Loading means the same thing:

dart
BlocListener<ProfileBloc, ProfileState>(
  listener: (context, state) {
    if (state is UpdateProfileSuccess) Snack.success('Profile updated');
    if (state is UpdateProfileFailed) Snack.error(state.message);
    if (state is DeleteProfileSuccess) context.pop();
  },
  child: ...,
)

final isUpdating = context.select<ProfileBloc, bool>(
  (bloc) => bloc.state is UpdateProfileLoading,
);
17. Binding Workflow
Inspect the screen — form or read-only, existing controllers, validation, submit callbacks, navigation, loading/error widgets, design-system components.
Inspect the BLoC — events, every state class, loading/success/failure/empty states, their data and error fields, existing event parameters.
Build the state → UI map explicitly (initial/loading/success/empty/failed, plus submit-loading/success/failed for forms).
Wire event dispatch — initial fetch, submit, retry, refresh, other actions.
Wire listeners — navigation, snackbars, dialogs, toasts, screen close.
Wire builders/selectors — content, loading, empty, error, button loading.
Preserve everything else — don't touch unrelated widgets.
Validate: event fires correctly; loading/success/error render; retry dispatches the right event; invalid forms don't submit; the button stops loading; success navigates exactly once; controllers are disposed; side effects live only in listeners; rebuilds are minimized.
18. Anti-Patterns
Dispatching in build() — build() { bloc.add(Fetch()); } re-fires on every rebuild. Use initState.
Navigating from BlocBuilder — causes repeated navigation on rebuild. Use BlocListener.
Showing snackbars/dialogs from BlocBuilder — same reason. Use BlocListener.
Duplicating repository calls in the UI — onRetry: () async => repository.fetch(). Dispatch the existing BLoC event instead.
Local isLoading bool duplicating BLoC state — let the BLoC's state be the only source of truth.
Inventing new state/event classes to make binding easier, when the project already has suitable ones — only add new ones if BLoC modification was explicitly requested.
Rewriting the screen — a binding task is not a refactor.
Final Standard

A correctly bound screen keeps this flow obvious and the UI as a thin presentation layer:

USER ACTION → UI dispatches BLoC event → BLoC runs existing business logic → BLoC emits state
                                                            │
                              ┌─────────────────────────────┴─────────────────────────────┐
                              ▼                                                             ▼
                  BlocBuilder / context.select                                       BlocListener
                  (renders UI from state)                                 (navigation, snackbar, dialog)

UI collects input → dispatches events → displays state → performs state-driven side effects. Business logic never moves into the screen just to make binding easier.