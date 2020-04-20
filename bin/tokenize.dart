import 'dart:convert';
import 'dart:io';

import 'package:fs_extensions/fs_extensions.dart';
import 'package:guard/guard.dart';
import 'package:tokenizer/tokenizer.dart';

void main(List<String> args) {
  final tokenizer = Tokenizer();
  final path = guard(() => args.first, 'lib/token.dart');

  final currentDir = Directory.current;
  final filePath = currentDir.path.joinAll(path.split('/'));
  final file = File(filePath);

  Utf8Decoder()
      .bind(file.openRead())
      .transform(tokenizer.streamTransformer)
      .listen((token) {
    stdout.write(token.value);
  });
}
