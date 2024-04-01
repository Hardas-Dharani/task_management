import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/repositories/user_repository.dart';
import '../models/user_firebase.dart';

// class ChatRepositoryImpl implements ChatRepository {
class UserRepository implements UserModelFirebaseRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseStorage _storage =
      FirebaseStorage.instance; // Firebase Storage instance

  @override
  Future<void> addUser(UserFireBaseModel user) async {
    try {
      // Check if the user already exists
      final existingUser = await usersCollection.doc(user.id).get();
      // if (!existingUser.exists) {
      // Add the user if they don't exist
      await usersCollection
          .doc(user.id)
          .set(user.toMap(), SetOptions(merge: true));
      // }
      // else {
      //   // Add the user if they don't exist
      //   await usersCollection.doc(user.id).set(user.toMap());
      // }
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  @override
  Future<UserFireBaseModel?> getUserById(String userId) async {
    try {
      DocumentSnapshot<Object?> userDoc =
          await usersCollection.doc(userId).get();

      if (userDoc.exists) {
        return UserFireBaseModel.fromMap(
            userDoc.data() as Map<String, dynamic>);
      } else {
        return null; // User not found
      }
    } catch (e) {
      print('Error fetching user by ID: $e');
      return null;
    }
  }

  @override
  Future<List<UserFireBaseModel>> getUsersFromChatMessages(
      String currentUserId) async {
    List<UserFireBaseModel> users = [];

    try {
      // Get the user IDs from the 'chats' collection where the current user is involved
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('chats')
              .where('members', arrayContains: currentUserId)
              .get();

      // Extract unique user IDs from the chat documents
      Set<String> uniqueUserIds = {};
      for (var chatDoc in querySnapshot.docs) {
        List<String> members = List<String>.from(chatDoc['members'] ?? []);
        uniqueUserIds.addAll(members);
      }

      // Fetch user details for each unique user ID and order by lastMessageTimestamp
      List<UserFireBaseModel> sortedUsers = [];
      for (var userId in uniqueUserIds) {
        if (userId != "") {
          if (userId != currentUserId) {
            // Exclude the current user's profile
            DocumentSnapshot<Map<String, dynamic>> userDoc =
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId)
                    .get();

            if (userDoc.exists) {
              UserFireBaseModel user =
                  UserFireBaseModel.fromMap(userDoc.data()!);
              sortedUsers.add(user);
            }
          }
        }
      }

      // // Sort the users based on lastMessageTimestamp
      // sortedUsers.sort((a, b) => (b.lastMessageTimestamp ?? DateTime(0))
      //     .compareTo(a.lastMessageTimestamp ?? DateTime(0)));

      users = sortedUsers;
    } catch (e) {
      print('Error fetching users from chat messages: $e');
    }

    return users;
  }

  @override
  Future<void> updateLastMessage(
      String userId, String chatId, String text) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      // Update the lastSeenTimestamp for the chat to the current time
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'lastMessage.$chatId': text,

        'newMessageCount.$chatId': FieldValue.increment(1),
        // 'lastMessageTimestamp': FieldValue.serverTimestamp(),
      });
      // await FirebaseFirestore.instance.collection('users').doc(userId).update({
      //   'lastMessage': text,
      // });
    }
  }

  @override
  Future<void> updateLastMessageOnly(
      String userId, String chatId, String text) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      // Update the lastSeenTimestamp for the chat to the current time
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'lastMessage.$chatId': text,
      });
      // await FirebaseFirestore.instance.collection('users').doc(userId).update({
      //   'lastMessage': text,
      // });
    }
  }

  @override
  Future<void> updateLastSeenTimestamp(String userId, String chatId) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'lastSeen.$chatId': FieldValue.serverTimestamp(),
        // 'lastMessageTimestamp': FieldValue.serverTimestamp(),
        'newMessageCount.$chatId': 0, // Reset unreadMessagesCount to zero
      });
      // Update the lastSeenTimestamp for the chat to the current time
      // await FirebaseFirestore.instance.collection('users').doc(userId).update({
      //   'lastSeen.$chatId': FieldValue.serverTimestamp(),
      // });
    }
  }

  // Upload image or video to Firebase Storage
  Future<String> uploadMedia(
      String userId, String mediaPath, bool isImage) async {
    try {
      Reference storageRef = _storage.ref().child(
          'media/$userId/${DateTime.now().millisecondsSinceEpoch}.${isImage ? 'jpg' : 'mp4'}');
      UploadTask uploadTask = storageRef.putFile(File(mediaPath));
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading media: $e');
      return '';
    }
  }
  //
  //Future<List<UserFireBaseModel>> getAllUsers() async {
  //   try {
  //     QuerySnapshot querySnapshot = await usersCollection.get();
  //     List<UserFireBaseModel> users = querySnapshot.docs
  //         .map((doc) => UserFireBaseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
  //         .toList();
  //     return users;
  //   } catch (e) {
  //     print('Error fetching users: $e');
  //     return [];
  //   }
  // }
}