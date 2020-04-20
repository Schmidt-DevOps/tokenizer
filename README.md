# tokenizer

[![lesnitsky.dev](https://lesnitsky.dev/shield.svg?hash=35651)](https://lesnitsky.dev?utm_source=tokenizer)
[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/tokenizer.svg?style=social)](https://github.com/lesnitsky/tokenizer)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Converts a stream of strings into stream of tokens splitted by delimiters

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
