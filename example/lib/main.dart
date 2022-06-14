import 'dart:async';

import 'package:tokenizer/tokenizer.dart';

/**
 * Shows the basic function of the tokenizer
 */
void main(List<String> args) async {
  final string = 'Hello, world';
  final tokenizer = Tokenizer({','});
  final c = StreamController<String>();

  c.add(string);
  c.close();

  final tokens = await c.stream.transform(tokenizer.streamTransformer).toList();
  print(tokens); // [Token("Hello"), Token(","), Token(" "), Token("world")]
}
