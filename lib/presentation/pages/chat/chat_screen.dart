import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/services/local_storage.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../data/models/user_firebase.dart';
import '../../../utils/styles.dart';
import 'controller/chat_controller.dart';
import 'widget/chat_list.dart';
import 'widget/message.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      initState: (v) {},
      builder: (_) {
        return MainScaffold(
          backgroundColor: Styles.black,
          extendBehindAppBar: true,
          appBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                    // final scaffoldState = Scaffold.of(context);
                    // scaffoldState.openDrawer();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Styles.white,
                  )),
              actions: const [],
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 90),
              const Center(
                child: Column(
                  children: [
                    // Image.asset(
                    //   "assets/images/icons/chat_yellow.png",
                    //   width: 38,
                    //   height: 38,
                    // ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextWidget(
                        textAlign: TextAlign.center,
                        text: "Your recent\nconversation",
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Styles.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 80),
                  decoration: const BoxDecoration(
                    color: Styles.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: StreamBuilder<List<UserFireBaseModel>>(
                    stream: controller.usersStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError || snapshot.data == null) {
                        return const Center(
                            child: CustomTextWidget(
                                text: "No chat available", fontSize: 18));
                      } else {
                        final users = snapshot.data!;
                        if (users.isEmpty) {
                          return const Center(
                              child: CustomTextWidget(
                                  text: "No chat available", fontSize: 18));
                        }
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: users.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          itemBuilder: (context, index) {
                            String id = controller.generateChatId(
                              users[index].id,
                              Get.find<LocalStorageService>()
                                  .loginModel!
                                  .data!
                                  .user!
                                  .id
                                  .toString(),
                            );

                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Get.to(() => MessageWidgetScreen(
                                    userFireBaseModel: users[index]));
                              },
                              child: ChatListWidget(
                                messageCount: users[index]
                                        .newMessageCount?[id]
                                        ?.toString() ??
                                    "",
                                expired: false,
                                title: (users[index].name ?? "")
                                            .split(' ')
                                            .length >
                                        1
                                    ? (users[index].name ?? "").split(' ')[1]
                                    : (users[index].name ?? ""),
                                image: users[index].profilePictureUrl,
                                subtitle: users[index].lastMessage?[id] ?? "",
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
