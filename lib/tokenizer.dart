import 'dart:async';

/// A tokenizer that converts a stream of strings into a stream of tokens
/// based on a set of defined separators.
class Tokenizer {
  final Set<String> separators;
  late final StreamTransformer<String, String> transformer;
  final bool emitSeparators;

  Tokenizer(this.separators, {this.emitSeparators = true}) {
    transformer = StreamTransformer.fromHandlers(
      handleData: _handleData,
      handleDone: _handleDone,
      handleError: _handleError,
    );
  }

  /// Processes incoming data and emits tokens
  void _handleData(String data, EventSink<String> sink) {
    final StringBuffer buffer = StringBuffer();
    
    for (int i = 0; i < data.length; i++) {
      final char = data[i];
      
      if (separators.contains(char)) {
        // Emit the accumulated token if exists
        if (buffer.isNotEmpty) {
          sink.add(buffer.toString());
          buffer.clear();
        }
        
        // Emit separator if configured to do so
        if (emitSeparators) {
          sink.add(char);
        }
      } else {
        buffer.write(char);
      }
    }
    
    // Emit any remaining token
    if (buffer.isNotEmpty) {
      sink.add(buffer.toString());
    }
  }

  /// Handles the completion of the stream
  void _handleDone(EventSink<String> sink) {
    sink.close();
  }

  /// Handles errors in the stream
  void _handleError(Object error, StackTrace stackTrace, EventSink<String> sink) {
    sink.addError(error, stackTrace);
  }
}
