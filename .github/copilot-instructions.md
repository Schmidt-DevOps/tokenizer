# Tokenizer Project - AI Agent Instructions

## Big Picture Architecture
This project provides a Dart-based tokenizer that converts a stream of strings into a stream of tokens based on a set of defined separators. The core component is the `Tokenizer` class, which utilizes Dart's Stream API for efficient, asynchronous processing of text. It's designed to be a flexible, stream-oriented lexer.

### Key Components:
- `lib/tokenizer.dart`: Contains the `Tokenizer` class, responsible for the tokenization logic. It implements a `StreamTransformer` to process input strings.
- `lib/token.dart`: Defines the `Token` class, a simple immutable class to represent a single token.

Data flow is typically: `Stream<String> Input` -> `Tokenizer.transformer` -> `Stream<String> Output Tokens`.

## Critical Developer Workflows

### Running Tests
Tests are written using the `package:test` library. To run all tests, execute the following command in the terminal from the project root:
```bash
dart test
```

### Debugging
To debug the application, you can use the standard VS Code Dart/Flutter debugging features. Set breakpoints in the `lib/tokenizer.dart` file, particularly within the `handleData` method, to observe the tokenization process step-by-step.

## Project-Specific Conventions and Patterns
- **Stream-based Processing**: The tokenizer leverages Dart Streams heavily for processing. Understanding `StreamTransformer` and `EventSink` is crucial.
- **Separator-driven Tokenization**: Tokenization is driven purely by a set of provided separator characters. There are no complex regex rules or state machines.
- **Immutability**: The `Token` class is immutable, promoting predictable behavior.

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

This demonstrates feeding a string into the tokenizer and collecting the resulting tokens.