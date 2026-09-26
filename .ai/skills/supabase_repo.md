# Supabase Repository Skill

Use this skill when creating or modifying Flutter Supabase repositories.

## Goal

Create simple repository classes that wrap `SupabaseClient` operations and return `DataResponse<T>`.

Follow the existing project pattern exactly. Do not introduce abstractions, helpers, services, models, or architecture that are not explicitly requested.

## Repository Structure

Use:

```dart
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/api/global_error.dart';
import '../../../../core/utils/error_log.dart';

class ExampleRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // METHOD
  Future<DataResponse<T>> methodName() async {
    try {
      // Supabase operation

      return DataResponse(data: result);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("ExampleRepo.methodName", e, stack),
      );
    }
  }
}
```

## Rules

### 1. Supabase Client

Always use the existing singleton:

```dart
final SupabaseClient _client = Supabase.instance.client;
```

Do not inject `SupabaseClient` unless explicitly requested.

### 2. Return Type

Repository methods must return:

```dart
Future<DataResponse<T>>
```

Use `void` when the operation does not need to return data:

```dart
Future<DataResponse<void>>
```

Use the appropriate type when data is returned:

```dart
Future<DataResponse<User>>
Future<DataResponse<List<Product>>>
Future<DataResponse<bool>>
```

### 3. Success

Return:

```dart
return DataResponse(data: result);
```

For successful operations with no meaningful result:

```dart
return DataResponse(data: null);
```

Do not create unnecessary success/result wrapper classes.

### 4. Error Handling

Wrap Supabase operations in:

```dart
try {
  // operation
} catch (e, stack) {
  return DataResponse(
    error: errorlog("ExampleRepo.methodName", e, stack),
  );
}
```

Always use the repository class name and method name in `errorlog`.

Example:

```dart
errorlog("AuthRepo.signIn", e, stack)
```

Do not add another error-handling abstraction.

### 5. User-Friendly Errors

Use the existing `globalError()` system when appropriate.

Do not duplicate error-message mapping inside every repository.

Existing mappings include cases such as:

* invalid login credentials
* email not confirmed
* user already registered
* network errors
* password errors
* fallback errors

Do not invent additional error messages unless the operation specifically requires one.

### 6. Supabase Errors

Let Supabase exceptions be caught by the existing error-handling flow.

Do not manually inspect every possible Supabase exception unless explicitly required.

### 7. Edge Functions

For Supabase Edge Functions:

```dart
final res = await _client.functions.invoke('function-name');
```

If the function requires HTTP/status validation, follow the existing pattern:

```dart
if (res.status != 200) {
  return DataResponse(
    error: "Operation failed (${res.status}): ${res.data}",
  );
}
```

Validate the response body only when the function contract requires it.

Do not add unnecessary response parsing.

### 8. Authentication

Use Supabase Auth directly:

```dart
_client.auth.signUp(...)
_client.auth.signInWithPassword(...)
_client.auth.signOut()
```

For current authentication state:

```dart
_client.auth.currentUser
_client.auth.currentSession
```

Do not create a separate authentication service unless explicitly requested.

### 9. Database Operations

Use the Supabase client directly:

```dart
_client.from('table')
```

Examples:

```dart
final data = await _client
    .from('products')
    .select();

return DataResponse(data: data);
```

For inserts:

```dart
await _client
    .from('products')
    .insert({
      'name': name,
    });

return DataResponse(data: null);
```

For updates:

```dart
await _client
    .from('products')
    .update({
      'name': name,
    })
    .eq('id', id);

return DataResponse(data: null);
```

For deletes:

```dart
await _client
    .from('products')
    .delete()
    .eq('id', id);

return DataResponse(data: null);
```

Keep queries straightforward and readable.

### 10. Do Not Overengineer

Do NOT introduce:

* repository interfaces
* abstract repositories
* generic repository classes
* result/either packages
* custom exception classes
* service layers
* use-case layers
* unnecessary DTOs
* unnecessary mappers
* dependency injection
* caching
* retries
* logging frameworks
* pagination abstractions
* generic Supabase helpers

unless explicitly requested.

## Existing DataResponse

Assume the project already contains:

```dart
class DataResponse<T> {
  final String? error;
  final T? data;

  bool get hasData => data != null;
  bool get hasError => error != null;

  DataResponse({
    this.error,
    this.data,
  });
}
```

Do not recreate or modify it.

## Existing Error Handling

Assume the project already contains:

```dart
String globalError(Object e) {
  final msg = e.toString().toLowerCase();

  if (msg.contains('invalid login credentials')) {
    return "Invalid email or password";
  }

  if (msg.contains('email not confirmed')) {
    return "Please verify your email";
  }

  if (msg.contains('user already registered')) {
    return "Account already exists";
  }

  if (msg.contains('network')) {
    return "Check your internet connection";
  }

  if (msg.contains('password')) {
    return "Password should be at least 6 characters";
  }

  return "Something went wrong";
}
```

Use the project's existing implementation. Do not recreate it.

## Output Requirements

When asked to create a repository:

1. Identify the required Supabase operation.
2. Create only the requested repository methods.
3. Follow the existing `DataResponse` pattern.
4. Use `errorlog()` in `catch`.
5. Keep the implementation minimal.
6. Do not add speculative functionality.
7. Do not explain unnecessary architecture.
8. Return production-ready Dart code.

### Example

For a request to create a product repository with `getProducts()`:

```dart
class ProductRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<dynamic>>> getProducts() async {
    try {
      final data = await _client
          .from('products')
          .select();

      return DataResponse(data: data);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("ProductRepo.getProducts", e, stack),
      );
    }
  }
}
```

Follow the user's existing project conventions over assumptions or preferred architecture.
