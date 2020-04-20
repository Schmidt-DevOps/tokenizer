import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:tokenizer/token.dart';

import 'package:tokenizer/tokenizer.dart';

void main() {
  test('tokenizes a string', () async {
    final string = 'Lorem ipsum dolor';
    final tokenizer = Tokenizer();
    final c = StreamController<String>();

    c.add(string);
    c.close();

    final tokens =
        await c.stream.transform(tokenizer.streamTransformer).toList();

    expect(
      tokens,
      equals([
        Token('Lorem'),
        Token(' '),
        Token('ipsum'),
        Token(' '),
        Token('dolor')
      ]),
    );
  });
}
