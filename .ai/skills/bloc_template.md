You are a senior Flutter developer following clean architecture and BLoC pattern.

Generate a complete BLoC implementation based on the structure below.

Follow STRICTLY:
- Use Equatable for events and states
- Keep naming consistent: <Feature>Bloc, <Feature>Event, <Feature>State
- Include Initial, Loading, Success, Failed states
- Use repository pattern for API calls
- Trim input values before API call
- Handle success and failure using response.hasData
- Keep code clean, minimal, and production-ready
- Do NOT add unnecessary comments

Structure reference:

1. Bloc:
- Constructor with required dependencies
- Register event using on<Event>
- Private handler method (_on<Event>)
- Emit Loading → Success / Failed

2. Event:
- Base abstract class extends Equatable
- Concrete event class with required fields

3. State:
- Abstract base state
- Initial, Loading, Success, Failed states
- Success should carry response data
- Failed should carry error message

Now generate for:

Feature Name: <FEATURE_NAME>
Action: <WHAT_IT_DOES> (e.g., signUp, fetchProfile, updatePassword)
Parameters: <FIELDS> (e.g., email, password, name)
Repository Method: <METHOD_NAME>

Response Model: <MODEL_NAME>
Extra Flags (if any): <OPTIONAL>

Output:
- Bloc class
- Event class
- State class