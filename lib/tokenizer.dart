import 'dart:async';
import 'token.dart';

class Tokenizer {
  final Set<String> delimiters = {' ', '\n'};

  StreamTransformer<String, Token> streamTransformer;

  Tokenizer([Set<String> delimiters]) {
    this.delimiters.addAll(delimiters ?? {});

    streamTransformer = StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        for (var token in tokenize(data)) {
          sink.add(token);
        }
      },
    );
  }

  Iterable<Token> tokenize(String chunk) sync* {
    String _sequence = '';

    for (int i = 0; i < chunk.length; i++) {
      final char = chunk[i];

      if (delimiters.contains(char)) {
        if (_sequence.length > 0) yield Token(_sequence);
        yield Token(char);
        _sequence = '';
      } else {
        _sequence += char;
      }
    }

    if (_sequence.length > 0) yield Token(_sequence);
  }
}
