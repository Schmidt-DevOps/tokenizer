# Dart Tokenizer

[![Dart](https://github.com/Schmidt-DevOps/tokenizer/actions/workflows/dart.yml/badge.svg)](https://github.com/Schmidt-DevOps/tokenizer/actions/workflows/dart.yml)

Converts a stream of strings into a stream of tokens separated by delimiters.

## Installation

pubspec.yaml:

```yaml
dependencies:
  tokenizer: ^0.0.1
```

or

```sh
pub global activate tokenizer
```

## Example

```dart
import 'dart:async';

import 'package:tokenizer/tokenizer.dart';

void main(List<String> args) async {
  final string = 'Hello, world';
  final tokenizer = Tokenizer({','});
  final c = StreamController<String>();

  c.add(string);
  c.close();

  final tokens = await c.stream.transform(tokenizer.streamTransformer).toList();
  print(tokens); // [Token("Hello"), Token(","), Token(" "), Token("world")]
}

```

## License

MIT
