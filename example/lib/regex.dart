import 'dart:async';

import 'package:tokenizer/tokenizer.dart';

/**
 * Build a regex from tokenized string list
 */
void main(List<String> args) async {
  final string = ' Vollkorn   Nudeln,   bio '; // add crazy whitespace too
  final string2 = ' ay bee cee '; // add crazy whitespace too
  final tokenizer = Tokenizer({',', ' '}, emitSeparators: false);
  final c = StreamController<String>();

  c.add(string);
  c.add(string2);
  c.close();

  final tokens = await c.stream.transform(tokenizer.transformer).toList();

  String regexp = buildRegexp(tokens);
  print(regexp); // (?=.*Hello)(?=.*world).*
}

/**
 * Build a regexp from tokenized string where all tokens may occur
 * in arbitrary order (using positive lookaheads).
 */
String buildRegexp(List<Token> tokens) {
  String regexp = "";
  tokens.forEach((token) => regexp += "(?=.*${token.value})");
  regexp += ".*";

  return regexp;
}
