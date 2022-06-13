import 'dart:async';
import 'package:test/test.dart';
import 'package:tokenizer/token.dart';
import 'package:tokenizer/tokenizer.dart';

void main() {
  test('tokenizes a string, space as delimiter', () async {
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
  test('tokenizes a string, space and comma as delimiter', () async {
    final string = 'Lorem, ipsum-dolor';
    final tokenizer = Tokenizer({' ', ',', '-'});
    final c = StreamController<String>();

    c.add(string);
    c.close();

    final tokens =
        await c.stream.transform(tokenizer.streamTransformer).toList();

    expect(
      tokens,
      equals([
        Token('Lorem'),
        Token(','),
        Token(' '),
        Token('ipsum'),
        Token('-'),
        Token('dolor')
      ]),
    );
  });
  test('tokenizes a string but excludes delimiters', () async {
    final string = 'Lorem, ipsum-dolor';
    final tokenizer = Tokenizer({' ', ',', '-'});
    tokenizer.tokenizeDelimiters = false;

    final c = StreamController<String>();

    c.add(string);
    c.close();

    final tokens =
        await c.stream.transform(tokenizer.streamTransformer).toList();

    expect(
      tokens,
      equals([Token('Lorem'), Token('ipsum'), Token('dolor')]),
    );
  });
}
