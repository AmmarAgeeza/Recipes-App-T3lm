# CLAUDE.md

---

# 🧠 Section A — Architecture Overview (STRICT)

## 1) Presentation & Data Layer Architecture (MANDATORY)
The project follows a streamlined, practical layer separation:
presentation → data

```
lib/features/<feature>/
  ├── presentation/   → Screens, component/ widgets, Cubits
  ├── data/           → Repos, Models, API Params

lib/core/             → Shared utilities, constants, themes, widgets
lib/app/              → App-level configuration (MyApp, etc.)
```

- Mirror the layout of existing sibling features. Do not invent a parallel structure.
- Shared/core code lives in `lib/core/`.
- **App-level widgets** (like `MyApp`) MUST live in `lib/app/`, not in `main.dart`.


### Responsibilities:

- **Presentation Layer**
  - UI rendering (Screens, Widgets)
  - User interaction
  - State management (**Cubit ONLY**)
  - **Business Logic Execution:** Cubits handle the core business logic, coordinate repository calls, and manage state transitions.

- **Data Layer**
  - API calls, local storage, caching
  - Models (DTOs / Data classes)
  - Repository implementations (manages data fetching and mapping)

### Rules:
- Never bypass layers
- Do not introduce a domain layer or UseCases; keep logic mapping direct from Cubit to Repository
- Do not introduce new architectural patterns without strong justification

---

## 2) Data Flow Pattern
Follow this strict flow:

UI → Cubit → Repository → API/Local  
API Response → Model → State → UI

- Data must always flow through this designated pipeline
- No shortcuts or direct calls from UI to Repositories or Data Sources

---

## 3) Dependency Injection
- Use **get_it** as the service locator
- Never instantiate Cubits or Repositories manually
- Always resolve using `sl<Type>()`
- All dependencies like new cubits and repos must be registered in `lib/core/services/service_locator.dart`.
---
### 4) Repository Pattern

- Every repository method returns `Either<String, T>` (dartz).
- `Left(errorMessage)` for failures, `Right(data)` for success.
- Map transport errors to `ServerException`, `UnauthorizedException`, etc.
---

## 5) Networking Rules
- HTTP calls go through `ApiConsumer` / `DioConsumer` only — never raw `Dio()`.
- Endpoints belong in the `EndPoints` class.
- Sensitive data (tokens, IDs) stored in `flutter_secure_storage` via `CacheHelper`, never plain `SharedPreferences`.
- Never call HTTP clients directly inside UI or Cubit
- Map all responses into models at the data layer before passing them to the Cubit
- Handle errors cleanly and propagate them safely via network exceptions/failures
```dart
// ❌ BAD — UI calls Dio directly
final res = await Dio().get('https://.../users');

// ✅ GOOD — repository uses injected ApiConsumer + EndPoints, returns Either
Future<Either<String, UserModel>> getProfile();
```
---
### 6. Navigation

- Use `AppRouter.onGenerateRoute` + `Routes` class + `KeyRouter` constants.
- Do **not** add `go_router` routes.

---

## 7) State Management
- Use **Cubit ONLY**
- Do NOT use BLoC, Provider, Riverpod, or GetX
- Cubits depend ONLY on Repositories
- `setState` allowed ONLY for local UI state (never business logic)
- Use **flutter_bloc Cubits** for all business state.
- Never use raw `setState` for cross-widget or business logic state.
- Single State Rule (MANDATORY): Do NOT create separate abstract state subclasses (e.g., no AuthLoading, AuthSuccess, etc.).
- Each Cubit must manage a single, unified State class extending Equatable.
 - Use status enums (e.g., BottomState, RequestState) to track loading/success/error statuses for different fields/operations within that single state.
 - Mix UI-specific state fields (e.g., password visibility toggles, button loading states, error messages) directly inside this single state class.
 - Always implement a robust copyWith method and override props with all state fields to maintain proper reactivity.
- **State File Separation (MANDATORY):** Each Cubit's State class MUST be in a separate file named `<feature>_state.dart` in the same directory as the Cubit.
 - Enums used by states MUST be centralized in `lib/core/constants/app_enums.dart`.
 - Do NOT define State classes or enums inside the Cubit file.
- **BlocObserver (MANDATORY):** All Cubit state changes MUST be observed using `BlocObserver`.
 - Create a custom `AppBlocObserver` in `lib/core/bloc/bloc_observer.dart`.
 - Set the observer in `main.dart` using `Bloc.observer = AppBlocObserver()`.
 - Use observer for logging all state changes, transitions, and errors.

## 8) Project Assets

| Type | Path |
|------|------|
| Images | `assets/images/` |
| Icons | `assets/icons/` |
| Fonts | `assets/fonts/` |

### Asset Management Rules (MANDATORY)
- **Font Usage:** ALWAYS use fonts from `assets/fonts/` directory. NEVER use `google_fonts` package or any external font package in `app_text_styles.dart`.
- **Image Paths:** NEVER hardcode image paths. Define all image paths in `lib/core/constants/app_assets.dart`.
- **App Strings:** NEVER hardcode UI strings. Define all user-facing strings in `lib/core/constants/app_strings.dart`.
```dart
// ❌ BAD — hardcoded path and string
Image.asset('assets/images/hero_image.png')
Text('Welcome Back')

// ✅ GOOD — use constants
Image.asset(AppImages.hero)
Text(AppStrings.welcomeBack)
```
---

# ⚙️ Section B — Global Engineering Rules

## 1) Clean Code (STRICT)
- Write readable, maintainable, and self-explanatory code
- Prefer clarity over cleverness
- Follow consistent formatting and structure

---

## 2) Code Structure
- Keep files small and focused
- Keep classes small with a single responsibility
- Keep functions short and purpose-driven

---

## 3) Comments
- Add comments ONLY when necessary
- Do NOT explain obvious code
- Use comments to explain WHY, not WHAT

---

## 4) Separation of Concerns
- Enforce presentation/data separation strictly
- Each layer has ONE responsibility
- NEVER put business logic inside UI; always isolate it in the Cubit

---

## 5) Engineering Principles
Always apply:
- SOLID
- DRY (Don’t Repeat Yourself)
- Maintainability and scalability best practices

---

## 6) Problem Solving
- Always fix the **root cause**, not symptoms
- Do not apply quick hacks or temporary fixes

---

## 7) Shared Code
- Any reusable logic used in 2+ places MUST go into `core/`
- Always check `core/` before creating new code
- Never duplicate logic across features

---

## 8) Performance Awareness (Flutter)
- Avoid unnecessary rebuilds
- Use `const` constructors whenever possible
- Keep widget trees shallow and composable
- Avoid heavy logic in `build()`

---

## 9) Edge Cases & Error Handling
- Always handle:
  - loading
  - success
  - error
  - empty states
- NEVER allow silent failures
- Validate all inputs and external data

---

## 10) Dependencies
- Do NOT add new packages unless necessary
- Every package must be:
  - latest stable version
  - well-maintained
  - production-ready
  - trusted

---

## 11) Security Awareness
- Never log sensitive data (tokens, credentials)
- Never hardcode secrets
- Validate all external inputs
- Flag potential security risks proactively

---

## 12) Logging (STRICT)
- **ONLY** use `log()` from `dart:developer` for logging.
- **NEVER** use `print()` or `debugPrint()` in production code.
- The `log()` function provides proper logging levels, timestamps, and works in all environments.
- Use different severity levels: `info`, `fine`, `warning`, `severe`.

```dart
// ❌ BAD — using print/debugPrint
print('User logged in');
debugPrint('Error occurred: $error');

// ✅ GOOD — using log
import 'dart:developer';
log('User logged in');
log('Error occurred', error: error, level: 1000); // severe
```

---

## 13) No Hardcoded Strings (STRICT)
- NEVER hardcode:
  - Image paths → use `AppImages` constants from `lib/core/constants/app_assets.dart`
  - UI strings → use `AppStrings` constants from `lib/core/constants/app_strings.dart`
  - Route paths → use `AppRoutes` constants
  - Any other user-facing text or asset paths
- All constants must follow naming conventions: `kThingName` or `thingName` based on existing patterns

---

## 14) Best Practices
- Always follow modern Flutter and Dart best practices
- Align with production-level standards

---

## 15) AI Behavior (IMPORTANT)
- Act as a **senior engineering partner**, not just a code generator
- Challenge unclear or incorrect assumptions
- Ask for clarification when needed
- Do NOT make assumptions without verification
- Prefer structured, step-by-step solutions

---

## 16) Naming Conventions

- Use clear, descriptive, and intention-revealing names

| Rule | Standard |
|------|----------|
| Type names | `PascalCase` |
| Members | `camelCase` |
| File names | `lower_snake_case` |
| Imports | Barrel file `lib/core/util/app_import.dart` |
| Constructors | `const` when possible |
| Logging | No `print`/`debugPrint` in production paths |

```dart
// ❌ BAD — ad-hoc deep imports everywhere
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...many more

// ✅ GOOD — match existing feature style; prefer app_import
import 'lib/core/util/app_import.dart';
```

---

## 17) Import Organization (STRICT)

**MANDATORY:** Use `lib/core/util/app_import.dart` for all common imports across the project.

- **NEVER** use deep/ad-hoc imports repeatedly in multiple files
- **ALL** common imports (Flutter, packages, core exports) MUST be centralized in `app_import.dart`
- **ONLY** feature-specific imports should be added directly to files

```dart
// ❌ BAD — ad-hoc deep imports everywhere
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// ...many more

// ✅ GOOD — use centralized app_import
import '../core/util/app_import.dart';

// ✅ OK — feature-specific imports added alongside app_import
import '../core/util/app_import.dart';
import '../../features/auth/presentation/cubits/login_cubit.dart';
```

**File:** `lib/core/util/app_import.dart` must export:
- Flutter material/widgets
- All commonly used packages (flutter_bloc, equatable, dartz, get_it)
- All core constants, themes, widgets
- All core utilities

---

---

## 18) App Structure (main.dart & MyApp)

---

## 18) App Structure (main.dart & MyApp)

**MANDATORY:** Keep `main.dart` minimal and clean.

- `main.dart` should ONLY contain:
  - `main()` function
  - `WidgetsFlutterBinding.ensureInitialized()` if needed
  - Service locator initialization
  - `runApp()` call

- `MyApp` class MUST be in `lib/app/app.dart`
- All app-level configuration (theme, routes, etc.) belongs in `lib/app/`

```dart
// ✅ GOOD — clean main.dart
// lib/main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  runApp(const MyApp());
}

// lib/app/app.dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(/*...*/);
  }
}
```

---

## Before Producing Code

1. **Check existing patterns** — open 1-2 sibling features to match style.
2. **Reuse `lib/core/widgets/`** shared components before creating duplicates.
3. **Extract widgets** — keep screens lean; split into `component/` files at ~150 lines.
4. **List performance** — use `ListView.builder` / slivers for dynamic data, not static `Column` children.
5. **Narrow rebuilds** — use `buildWhen` in `BlocBuilder` to minimize unnecessary work.


# 🚀 Final Principle

> The system must remain scalable, maintainable, and predictable.  
> AI must follow the architecture — never improvise or break structure.