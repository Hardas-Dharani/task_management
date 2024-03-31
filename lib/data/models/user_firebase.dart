class UserFireBaseModel {
  final String id;
  final String name;
  final bool isOnline;
  final String profilePictureUrl;
  // int newMessageCount;
  DateTime? lastMessageTimestamp;

  // String? lastMessage;
  final Map<String, dynamic> lastSeen; // Map to store last seen information
  final Map<String, dynamic>? lastMessage; // Map to store last seen information
  final Map<String, dynamic>?
      newMessageCount; // Map to store last seen information
  // final Map<String, dynamic> lastSeen; // Map to store last seen information

  UserFireBaseModel({
    required this.id,
    required this.name,
    required this.isOnline,
    this.newMessageCount,
    this.lastMessageTimestamp,
    this.lastMessage,
    required this.profilePictureUrl,
    required this.lastSeen,
  });

  // ... other methods

  factory UserFireBaseModel.fromMap(Map<String, dynamic> map) {
    return UserFireBaseModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      isOnline: map['isOnline'] ?? false,
      newMessageCount: map['newMessageCount'] ?? {},
      lastMessage: map['lastMessage'] ?? {},
      // lastMessageTimestamp: map['lastMessageTimestamp'] != null
      //     ? (map['lastMessageTimestamp'] as Timestamp).toDate()
      //     : null,
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      lastSeen: map['lastSeen'] ?? {}, // Initialize lastSeen with an empty map
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lastMessageTimestamp': lastMessageTimestamp,
      'name': name,
      'isOnline': isOnline,
      'lastMessage': lastMessage,
      'newMessageCount': newMessageCount,
      'profilePictureUrl': profilePictureUrl,
      'lastSeen': lastSeen,
    };
  }
}
