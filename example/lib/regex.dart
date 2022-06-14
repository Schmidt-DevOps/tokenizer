import 'dart:async';

import 'package:tokenizer/tokenizer.dart';

/**
 * Build a regex from tokenized string list
 */
void main(List<String> args) async {
  final string = ' Vollkorn   Nudeln,   bio '; // add crazy whitespace too
  final tokenizer = Tokenizer({',', ' '});
  tokenizer.tokenizeDelimiters = false; // not interested in delimiters here
  final c = StreamController<String>();

  c.add(string);
  c.close();

  final tokens = await c.stream.transform(tokenizer.streamTransformer).toList();

  String regexp = "";
  tokens.forEach((token) {
    regexp += "(?=.*${token.value})";
  });
  regexp += ".*";
  print(regexp); // (?=.*Hello)(?=.*world).*
}
