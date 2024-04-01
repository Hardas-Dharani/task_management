import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/user_firebase.dart';
import '../../../../data/repositories/chat_repository_impl.dart';
import '../../../../data/repositories/user_repository_impl.dart';
import '../../../../domain/entities/chat_message.dart';
import '../../../../domain/repositories/chat_repository.dart';
import '../../../../utils/custom_snack_bar.dart';

class ChatController extends GetxController {
  bool isKeyboardVisible = false;

  List<Map<String, dynamic>> userChatList = [
    {
      "name": "Sara Chester",
      "message": "I didnt go to work yesterday, you?",
      "": "https://img.freepik.com/premium-vector/red-haired-woman-with-british-flag-background_893012-35631.jpg",
      "expired": false,
      "messageCount": "2"
    },
    {
      "name": "Jamaina Butt",
      "message": "Expired yesterday",
      "image":
          "https://img.freepik.com/premium-photo/romantic-girl-thinking-with-phone-looking-aside-smiling-dreamy-using-dating-app-smartphone-standing-beige_1258-34293.jpg",
      "expired": true,
      "messageCount": "2"
    },
    {
      "name": "Jamaina Butt",
      "message": "I didnt go to work yesterday, you?",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSIVdAUdDxuP5KhbGyXie7T2IALjlmEjh9rw&usqp=CAU",
      "expired": false,
      "messageCount": "2"
    },
    {
      "name": "Sara Chester",
      "message": "I didnt go to work yesterday, you?",
      "image":
          "https://www.muscleandfitness.com/wp-content/uploads/2017/04/woman-beach-1280.jpg?w=1280&h=731&crop=1&quality=86&strip=all",
      "expired": false,
      "messageCount": "2"
    }
  ];

  final ChatRepository _chatRepository = ChatRepositoryImpl();
  final UserRepository _userRepository = UserRepository();
  List<ChatMessage> chatMessages = <ChatMessage>[];
  final _chatMessagesController =
      StreamController<List<ChatMessage>>.broadcast();

  TextEditingController chatMessage = TextEditingController();

  final ScrollController scrollController = ScrollController();

  final _storage = FirebaseStorage.instance;
  List<UserFireBaseModel> userModelFirebase = [];

  final StreamController<List<UserFireBaseModel>> _usersController =
      StreamController<List<UserFireBaseModel>>.broadcast();

  String? selectedFile;
  UserFireBaseModel? onlineUserData;

  List<UserFireBaseModel> users = [];

  Stream<List<ChatMessage>> get chatMessagesStream =>
      _chatMessagesController.stream;

  Stream<List<UserFireBaseModel>> get usersStream => _usersController.stream;

  int calculateNewMessageCount(List<ChatMessage> chatMessages, String userId,
      DateTime lastSeenTimestamp) {
    // Logic to calculate the count of new messages for a user
    return chatMessages
        .where((message) =>
            message.sender == userId &&
            !message.isSent &&
            message.timestamp.isAfter(lastSeenTimestamp))
        .length;
  }

  Future<void> camPick(
      String senderID, String receiverID, UserFireBaseModel reciverData) async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      // Assuming you are using the controller's chatMessage.text for optional text description
      sendMessage(senderID, receiverID, chatMessage.text, File(result.path),
          MessageType.Image, reciverData);
      // Optionally, you can handle the UI update separately if needed
      selectedFile = result.path;
      update();
    } else {
      CustomSnackBar.show('No Image picked');
    }
  }

  int compareLastSeen(UserFireBaseModel a, UserFireBaseModel b) {
    try {
      var chatId = generateChatId(
        a.id,
        "1",
      );
      var chatIdb = generateChatId(
        b.id,
        "1",
      );

      var aLastSeen = a.lastSeen[chatId] ?? 0; // Default to 0 if null
      var bLastSeen = b.lastSeen[chatIdb] ?? 0; // Default to 0 if null
      if (aLastSeen == 0) {
        return 0;
      }
      if (bLastSeen == 0) {
        return 0;
      }
      // Sort in descending order based on the lastSeen timestamp
      return bLastSeen.compareTo(aLastSeen);
    } catch (e) {
      print('Error comparing lastSeen values: $e');
      return 0; // Handle error by considering them equal
    }
  }

  Future<void> galleryPick(
      String senderID, String receiverID, UserFireBaseModel reciverData) async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      // Assuming you are using the controller's chatMessage.text for optional text description
      sendMessage(senderID, receiverID, chatMessage.text, File(result.path),
          MessageType.Image, reciverData);
      // Optionally, you can handle the UI update separately if needed
      selectedFile = result.path;
      update();
    } else {
      CustomSnackBar.show('No Image picked');
    }
  }

  String generateChatId(String userId1, String userId2) {
    List<String> sortedIds = [userId1, userId2]..sort();
    return sortedIds.join('_');
  }

  getUserById(String id) async {
    try {
      UserFireBaseModel? users = await _userRepository.getUserById(id);
      onlineUserData = users;
      print(users);
    } catch (e) {
      print('Error in getUsersFromChatMessages: $e');
    }
    update();
  }

  // getUserById
  // Function to get users from chat messages and update the stream
  getUsersFromChatMessages() async {
    try {
      _usersController.add([]);

      users = await _userRepository.getUsersFromChatMessages("1");
      try {
        users.sort((a, b) {
          return compareLastSeen(a, b);
        });
      } catch (e) {
        print('Error sorting users: $e');
      }

      // Emit the updated list of users to the stream
      _usersController.add(users);
    } catch (e) {
      print('Error in getUsersFromChatMessages: $e');
    }
    update();
  }

  Stream<List<ChatMessage>> loadChatMessages(
      String senderID, String receiverID) {
    final chatId = generateChatId(senderID, receiverID);
    chatMessages = [];

    _userRepository.updateLastSeenTimestamp(receiverID, chatId);
    // _userRepository.updateLastSeenTimestamp(receiverID, chatId);

    //  ;
    // Return the Stream directly
    return _chatRepository.getChatMessages(chatId, senderID).map((messages) {
      // Add new messages to the existing list
      List<ChatMessage> newMessages = List.from(chatMessages);
      newMessages.addAll(messages);
      // chatMessages.assignAll(newMessages);

      // Add the new messages to the stream
      // _chatMessagesController.add(newMessages);
      return newMessages;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUsersFromChatMessages();
    super.onInit();
  }

  // Function to scroll down
  void scrollDown() {
    if (scrollController.hasClients) {
      double maxScroll = scrollController.position.maxScrollExtent;
      double pixelsToScroll = maxScroll - scrollController.offset;
      scrollController.animateTo(
        maxScroll - pixelsToScroll,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> sendMessage(
      String senderID,
      String receiverID,
      String text,
      File? mediaFile,
      MessageType messageType,
      UserFireBaseModel reciverData) async {
    final chatId = generateChatId(senderID, receiverID);

    String mediaUrl = ''; // Will store the URL of the uploaded media file

    if (mediaFile != null) {
      // Upload media file and get URL
      mediaUrl = await _userRepository.uploadMedia(
          senderID, mediaFile.path, messageType == MessageType.Image);
    }

    final newMessage = ChatMessage(
      sender: senderID,
      type: messageType,
      text: messageType == MessageType.Text
          ? text
          : messageType == MessageType.VideoCalling
              ? text
              : messageType == MessageType.VoiceCalling
                  ? text
                  : mediaUrl,
      timestamp: DateTime.now(),
      isSent: true,
    );

    chatMessages.add(newMessage);
    UserFireBaseModel? senderData = await _userRepository.getUserById(senderID);
    _userRepository.updateLastMessage(
        senderID,
        chatId,
        messageType == MessageType.Text
            ? text
            : messageType == MessageType.VideoCalling
                ? "Video Call"
                : messageType == MessageType.VoiceCalling
                    ? "Voice Call"
                    : "Image");
    _userRepository.updateLastMessageOnly(
        receiverID,
        chatId,
        messageType == MessageType.Text
            ? text
            : messageType == MessageType.VideoCalling
                ? "Video Call"
                : messageType == MessageType.VoiceCalling
                    ? "Voice Call"
                    : "Image");

    await _chatRepository.sendMessage(chatId, senderID, receiverID, text,
        mediaUrl, messageType, senderData, reciverData);

    getUsersFromChatMessages();
  }

  Future<String?> uploadFile(File file, String fileName) async {
    try {
      final Reference storageReference = _storage.ref().child(fileName);
      final UploadTask uploadTask = storageReference.putFile(file);
      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading file: $e");
      return null;
    }
  }
}
