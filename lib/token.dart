class Token {
  final String value;

  const Token(this.value);

  @override
  bool operator ==(Object other) {
    return other is Token && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  toString() => 'Token("${value.replaceAll('\n', '\\n')}")';
  toStringShort() => value;
}
