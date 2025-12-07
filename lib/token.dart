/// Represents a token with a value
class Token {
  final String value;

  const Token(this.value);

  @override
  bool operator ==(Object other) {
    return other is Token && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Token("${value.replaceAll('\n', '\\n')}")';
  
  /// Returns a short representation of the token
  String toStringShort() => value;
}
