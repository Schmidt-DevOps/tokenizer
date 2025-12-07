# Tokenizer Project - AI Agent Instructions

## Big Picture Architecture
This project provides a Dart-based tokenizer that converts a stream of strings into a stream of tokens based on a set of defined separators. The core component is the `Tokenizer` class, which utilizes Dart's Stream API for efficient, asynchronous processing of text. It's designed to be a flexible, stream-oriented lexer.

### Key Components:
- `lib/tokenizer.dart`: Contains the `Tokenizer` class, responsible for the tokenization logic. It implements a `StreamTransformer` to process input strings.
- `lib/token.dart`: Defines the `Token` class, a simple immutable class to represent a single token.

Data flow is typically: `Stream<String> Input` -> `Tokenizer.transformer` -> `Stream<String> Output Tokens`.

## Core Development Principles
When working on this project, always adhere to the following principles:
- **SOLID Principles**: Ensure code maintains Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion.
- **DRY (Don't Repeat Yourself)**: Avoid code duplication and promote reusable components.
- **Clean Code**: Prioritize readability, maintainability, and clarity in all code.
- **Immutability**: The `Token` class is immutable. Strive to maintain immutability where appropriate for other data structures.

## Critical Developer Workflows

### Running Tests
Tests are written using the `package:test` library. To run all tests, execute the following command in the terminal from the project root:
```bash
flutter test
```
Before running tests, ensure dependencies are up to date:
```bash
flutter pub get
```

### Debugging
To debug the application, you can use the standard VS Code Dart/Flutter debugging features. Set breakpoints in the `lib/tokenizer.dart` file, particularly within the `_handleData` method, to observe the tokenization process step-by-step.

### Refactoring
When refactoring, ensure that changes adhere to SOLID, DRY, and clean code principles. Pay special attention to the Stream API interactions and the immutability of `Token` objects.

### Makefile Usage
The project includes a `Makefile` with common targets. Use it for tasks like:
- `make pub-get`: Fetches project dependencies.
- `make test`: Runs all tests.
- `make clean`: Cleans the Flutter project and removes coverage data.
- `make format`: Formats Dart code.
- `make analyze`: Analyzes Dart code for issues.
- `make coverage`: Generates test coverage report.
- `make show_coverage`: Generates and opens the HTML coverage report.

## Project-Specific Conventions and Patterns
- **Stream-based Processing**: The tokenizer leverages Dart Streams heavily for processing. Understanding `StreamTransformer` and `EventSink` is crucial. Be mindful of stream lifecycle (handling `handleData`, `handleDone`, `handleError`).
- **Separator-driven Tokenization**: Tokenization is driven purely by a set of provided separator characters. There are no complex regex rules or state machines, maintain this simplicity.
- **Immutability**: The `Token` class is immutable, promoting predictable behavior. Avoid introducing mutable state where immutability is beneficial.

## Integration Points
The `Tokenizer` class exposes a `transformer` property, which is a `StreamTransformer<String, String>`. This allows it to be easily integrated into any Dart Stream pipeline where string processing and tokenization are required.

## Example Usage Pattern

An example of how to use the `Tokenizer` can be found in `example/lib/main.dart` and `test/tokenizer_test.dart`. A common pattern involves creating a `StreamController` to feed strings into the tokenizer:

```dart
// ...existing code...
final string = 'Hello, world!';
final tokenizer = Tokenizer({' ', ','});
final controller = StreamController<String>();

controller.add(string);
controller.close();

final tokens = await controller.stream.transform(tokenizer.transformer).toList();

// tokens will contain ['Hello', ',', ' ', 'world', '!'] or similar depending on emitSeparators
// ...existing code...
```

This demonstrates feeding a string into the tokenizer and collecting the resulting tokens. Always refer to `_handleData` in `lib/tokenizer.dart` for the core tokenization logic.