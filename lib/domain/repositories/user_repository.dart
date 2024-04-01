import '../../data/models/user_firebase.dart';

abstract class UserModelFirebaseRepository {
  Future<void> addUser(UserFireBaseModel user);
  Future<UserFireBaseModel?> getUserById(String userId);
  Future<List<UserFireBaseModel>> getUsersFromChatMessages(
      String currentUserId);
  Future<void> updateLastMessage(String userId, String chatId, String text);
  Future<void> updateLastSeenTimestamp(String userId, String chatId);
  // Future<List<UserFireBaseModel>> getAllUsers(String userID)
}
