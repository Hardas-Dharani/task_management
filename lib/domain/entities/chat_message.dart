class ChatMessage {
  final String sender;
  final String text;
  final String? mediaUrl; // Updated to be nullable and renamed to mediaUrl
  final MessageType type; // Added MessageType to identify the type of message
  final DateTime timestamp;
  final bool isSent;

  ChatMessage({
    required this.sender,
    required this.text,
    this.mediaUrl, // Made mediaUrl nullable
    required this.type, // Added MessageType parameter
    required this.timestamp,
    required this.isSent,
  });
}

enum MessageType { Text, Image, Video, VoiceCalling, VideoCalling }
