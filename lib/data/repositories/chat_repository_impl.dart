import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../models/user_firebase.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> changeProfilePicture(String userId, String image) async {
    await _firestore.collection('users').doc(userId).set(
        {'profilePictureUrl': image},
        SetOptions(merge: true)).whenComplete(() => print("fdsfsafsa"));
  }

  // final CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');

  @override
  Stream<List<ChatMessage>> getChatMessages(String chatId, String senderID) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return ChatMessage(
          sender: data['sender'],
          text: data['text'],
          mediaUrl: data['mediaUrl'], // Update to handle mediaUrl
          type: MessageType
              .values[data['type']], // Map 'type' to MessageType enum
          timestamp: data['timestamp'] != null
              ? (data['timestamp'] as Timestamp).toDate()
              : DateTime.now(), // Use current time if timestamp is null
          isSent: data['sender'] == senderID /* Replace with current user ID */,
        );
      }).toList();
    }).distinct();
  }

  @override
  Future<void> sendMessage(
      String chatId,
      String sender,
      String receiver,
      String text,
      String? mediaUrl,
      MessageType type,
      UserFireBaseModel? senderData,
      UserFireBaseModel? reciver) async {
    try {
      // Check if the chat already exists
      var chatDoc = await _firestore.collection('chats').doc(chatId).get();

      if (!chatDoc.exists) {
        // Create a new chat document with members
        await _firestore.collection('chats').doc(chatId).set({
          'members': [sender, receiver],
          // Add other chat properties as needed
        });
      }

      // Add the message to the 'messages' subcollection
      // await _firestore.collection('chats').doc(chatId).collection('users').add(
      //     {"userSender": senderData!.toMap(), "userReciver": reciver!.toMap()});
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'sender': sender,
        'receiver': receiver,
        'text': text,
        'mediaUrl': mediaUrl, // Include mediaUrl for images or videos
        'type': type.index, // Store the index of the MessageType enum
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> setUserOnlineStatus(String userId, bool isOnline) async {
    await _firestore.collection('users').doc(userId).set({'isOnline': isOnline},
        SetOptions(merge: true)).whenComplete(() => print("fdsfsafsa"));
  }
}
