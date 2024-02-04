import 'dart:async';

abstract class Communication {
  static final StreamController<Map<String, dynamic>> _onMessageReceived = StreamController<Map<String, dynamic>>.broadcast();
  static final StreamController<Map<String, dynamic>> _onMessageSent = StreamController<Map<String, dynamic>>.broadcast();
  static Stream<Map<String, dynamic>> get onMessageReceived => _onMessageReceived.stream;
  static Stream<Map<String, dynamic>> get onMessageSent => _onMessageSent.stream;

  static void sendMessage(Map<String, dynamic> message) {
    _onMessageSent.add(message);
  }


}