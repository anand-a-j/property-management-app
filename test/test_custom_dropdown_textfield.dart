
import 'package:naseem/core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const items = ['Apple', 'Banana', 'Cherry', 'Mango'];

  Widget buildTestable({
    String? initialValue,
    bool enabled = true,
    bool readOnly = false,
    ValueChanged<String?>? onChanged,
    String? Function(String?)? validator,
    GlobalKey<FormState>? formKey,
  }) {
    final field = CustomDropdownField<String>(
      items: items,
      labelText: 'Fruit',
      hintText: 'Select a fruit',
      itemLabel: (item) => item,
      initialValue: initialValue,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      validator: validator,
    );

    return MaterialApp(
      home: Scaffold(
        body: formKey != null ? Form(key: formKey, child: field) : field,
      ),
    );
  }

  /// The field's actual current text lives on the EditableText's
  /// controller, not as a `Text` widget - so we read it directly
  /// rather than using `find.text`.
  String currentFieldText(WidgetTester tester) {
    final editable = tester.widget<EditableText>(find.byType(EditableText));
    return editable.controller.text;
  }

  /// `find.text` matches both `Text` widgets AND `EditableText` widgets
  /// with that value - so when the field's current text and a dropdown
  /// item happen to be the same string (e.g. an initial value), it
  /// returns two matches. This restricts the search to the dropdown
  /// list's `Text` widgets only.
  Finder findOption(String text) =>
      find.byWidgetPredicate((widget) => widget is Text && widget.data == text);

  testWidgets('shows label and hint text when nothing is selected', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestable());

    expect(find.text('Fruit'), findsOneWidget);
    expect(find.text('Select a fruit'), findsOneWidget);
  });

  testWidgets('pre-fills the field with the initial value\'s label', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestable(initialValue: 'Banana'));

    expect(currentFieldText(tester), 'Banana');
  });

  testWidgets('tapping the field shows every item, even with prefilled text', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestable(initialValue: 'Banana'));

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    for (final item in items) {
      expect(findOption(item), findsOneWidget);
    }
  });

  testWidgets('typing filters the option list', (tester) async {
    await tester.pumpWidget(buildTestable());

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), 'ban');
    await tester.pumpAndSettle();

    expect(findOption('Banana'), findsOneWidget);
    expect(findOption('Apple'), findsNothing);
    expect(findOption('Cherry'), findsNothing);
    expect(findOption('Mango'), findsNothing);
  });

  testWidgets('falls back to the full list when nothing matches the query', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestable());

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), 'zzz');
    await tester.pumpAndSettle();

    for (final item in items) {
      expect(findOption(item), findsOneWidget);
    }
  });

  testWidgets('selecting an option calls onChanged and fills the field', (
    tester,
  ) async {
    String? selected;
    await tester.pumpWidget(buildTestable(onChanged: (v) => selected = v));

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    await tester.tap(findOption('Cherry'));
    await tester.pumpAndSettle();

    expect(selected, 'Cherry');
    expect(currentFieldText(tester), 'Cherry');
    // Overlay should be closed after selection.
    expect(findOption('Apple'), findsNothing);
  });

  testWidgets(
    'reverts to the last valid selection if focus is lost without picking an option',
    (tester) async {
      await tester.pumpWidget(buildTestable(initialValue: 'Apple'));

      await tester.tap(find.byType(TextFormField));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'random text');
      await tester.pumpAndSettle();

      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle();

      expect(currentFieldText(tester), 'Apple');
    },
  );

  testWidgets('a disabled field does not open the option list on tap', (
    tester,
  ) async {
    await tester.pumpWidget(buildTestable(enabled: false));

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    expect(findOption('Apple'), findsNothing);
  });

  testWidgets('shows the validation message from Form validation', (
    tester,
  ) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      buildTestable(
        formKey: formKey,
        validator: (value) =>
            (value == null || value.isEmpty) ? 'Required' : null,
      ),
    );

    formKey.currentState!.validate();
    await tester.pumpAndSettle();

    expect(find.text('Required'), findsOneWidget);
  });

  testWidgets('shows a fallback message when there are no items at all', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDropdownField<String>(
            items: const [],
            labelText: 'Fruit',
            hintText: 'Select a fruit',
            itemLabel: (item) => item,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    expect(find.text('No options available'), findsOneWidget);
  });

  testWidgets('works with a custom data type, not just primitives', (
    tester,
  ) async {
    const fruits = [_Fruit('Apple'), _Fruit('Banana')];
    _Fruit? selected;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDropdownField<_Fruit>(
            items: fruits,
            labelText: 'Fruit',
            hintText: 'Select a fruit',
            itemLabel: (f) => f.name,
            onChanged: (f) => selected = f,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    await tester.tap(findOption('Banana'));
    await tester.pumpAndSettle();

    expect(selected?.name, 'Banana');
  });
}

class _Fruit {
  const _Fruit(this.name);
  final String name;
}
