import 'dart:async';

import 'package:tokenizer/tokenizer.dart';

/**
 * Shows the basic function of the tokenizer
 */
void main(List<String> args) async {
  final string = 'Hello, world';
  final tokenizer = Tokenizer({','});
  final controller = StreamController<String>();

  controller.add(string);
  controller.close();

  final tokens = await controller.stream.transform(tokenizer.transformer).toList();
  print(tokens); // ["Hello", ",", " ", "world"]
}
