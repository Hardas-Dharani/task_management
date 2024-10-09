import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';

import '../../../../components/custom_text_component.dart';
import '../../../../data/models/user_firebase.dart';
import '../../../../domain/entities/chat_message.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/toast_component.dart';
import '../controller/chat_controller.dart';

class MessageWidgetScreen extends GetView<ChatController> {
  UserFireBaseModel? userFireBaseModel;
  MessageWidgetScreen({super.key, required this.userFireBaseModel});
  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return KeyboardVisibilityBuilder(builder: (context, isVisible) {
      // controller.isKeyboardVisible = isVisible;
      return GetBuilder<ChatController>(initState: (v) {
        controller.chatMessage.clear();
        controller.getUserById(userFireBaseModel!.id);
      }, builder: (_) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Styles.black,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              children: [
                Container(
                    width: Get.width,

                    // height: 45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: const BoxDecoration(
                      // color: Styles.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          IconButton(
                              padding: const EdgeInsets.only(right: 5, top: 10),
                              color: Styles.white,
                              alignment: Alignment.centerRight,
                              onPressed: () {
                                Get.back();
                                // controller.onWillPop();
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 50 / 812,
                                  width: Get.width * 50 / 375,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                              
                                      Image.asset(
                                        "assets/images/teacher_icon.png",
                                        height: 79,
                                        width: 79,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: Get.width * 7 / 375),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: userFireBaseModel!.name
                                          .trim()
                                          .split(' ')
                                          .first,
                                      color: Styles.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),

                                    SizedBox(height: Get.height * 4 / 812),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 08,
                                          color:
                                              controller.onlineUserData != null
                                                  ? controller.onlineUserData!
                                                          .isOnline
                                                      ? Colors.green
                                                      : Colors.grey
                                                  : userFireBaseModel!.isOnline
                                                      ? Colors.green
                                                      : Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomTextWidget(
                                          text:
                                              controller.onlineUserData != null
                                                  ? controller.onlineUserData!
                                                          .isOnline
                                                      ? "Online"
                                                      : "Offline"
                                                  : userFireBaseModel!.isOnline
                                                      ? "Online"
                                                      : "Offline",
                                          color: Styles.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    // CustomText(
                                    //   text: controller.getOnlineStatus(int.parse((controller.chatListModel?.data?.id ?? 0).toString())) ? "Online" : 'Offline',
                                    //   color: AppColors.containerGreyColor2,
                                    //   fontSize: Styles().fontSize12,
                                    //   fontWeight: FontWeight.w600,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )),
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    controller: controller.scrollController,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 24 / 375,
                          vertical: Get.height * 20 / 812),
                      child: Column(
                        children: [
                          StreamBuilder<List<ChatMessage>>(
                            stream: controller.loadChatMessages(
                                Get.find<LocalStorageService>()
                                    .loginModel!
                                    .data!
                                    .user!
                                    .id
                                    .toString(),
                                userFireBaseModel!.id),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return Container();
                              } else {
                                List<ChatMessage> messages = snapshot.data!;

                                return ListView.separated(
                                  shrinkWrap: true,
                                  reverse: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    ChatMessage message =
                                        messages[messages.length - 1 - index];
                                    bool isSent = message.isSent;

                                    return Column(
                                      crossAxisAlignment: isSent
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: isSent
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (!isSent)
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage: NetworkImage(
                                                    userFireBaseModel
                                                            ?.profilePictureUrl ??
                                                        "https://raysensenbach.com/wp-content/uploads/2013/04/default.jpg"),
                                                radius: 18.5,
                                              ),
                                            if (!isSent)
                                              const SizedBox(width: 5),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: isSent
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start,
                                                children: [
                                                  // const SizedBox(height: 4.3),
                                                  // if (message.type ==
                                                  //     MessageType.VideoCalling)
                                                  //   Container(
                                                  //     decoration: BoxDecoration(
                                                  //       color: Styles.white,
                                                  //       borderRadius:
                                                  //           BorderRadius
                                                  //               .circular(8),
                                                  //     ),
                                                  //     child: Padding(
                                                  //       padding:
                                                  //           const EdgeInsets
                                                  //               .symmetric(
                                                  //               horizontal: 20,
                                                  //               vertical: 15),
                                                  //       child: Column(
                                                  //         crossAxisAlignment: isSent
                                                  //             ? CrossAxisAlignment
                                                  //                 .end
                                                  //             : CrossAxisAlignment
                                                  //                 .start,
                                                  //         children: [
                                                  //           if (!isSent)
                                                  //             CustomTextWidget(
                                                  //               // textAlign:
                                                  //               //     TextAlign
                                                  //               //         .start,
                                                  //               text:
                                                  //                   userFireBaseModel!
                                                  //                       .name
                                                  //                       .trim()
                                                  //                       .split(
                                                  //                           ' ')
                                                  //                       .first,
                                                  //               fontSize: 13,
                                                  //               textAlign:
                                                  //                   TextAlign
                                                  //                       .start,
                                                  //               fontWeight:
                                                  //                   FontWeight
                                                  //                       .w600,
                                                  //               color: Styles
                                                  //                   .black,
                                                  //             ),
                                                  //           if (isSent)
                                                  //             const CustomTextWidget(
                                                  //               textAlign:
                                                  //                   TextAlign
                                                  //                       .start,
                                                  //               text: "You",
                                                  //               fontSize: 13,
                                                  //               fontWeight:
                                                  //                   FontWeight
                                                  //                       .w600,
                                                  //               color: Styles
                                                  //                   .black,
                                                  //             ),
                                                  //           const SizedBox(
                                                  //             height: 5,
                                                  //           ),
                                                  //           SizedBox(
                                                  //             width: 120,
                                                  //             child: Row(
                                                  //               mainAxisAlignment:
                                                  //                   MainAxisAlignment
                                                  //                       .spaceBetween,
                                                  //               children: [
                                                  //                 Image.asset(
                                                  //                   Styles.getIconImage(
                                                  //                       "video_calling.png"),
                                                  //                   width: 35,
                                                  //                 ),
                                                  //                 const CustomTextWidget(
                                                  //                   text:
                                                  //                       "Video Calling",
                                                  //                   fontSize:
                                                  //                       13,
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w500,
                                                  //                   color: Styles
                                                  //                       .black,
                                                  //                 ),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // if (message.type ==
                                                  //     MessageType.VoiceCalling)
                                                  //   Container(
                                                  //     decoration: BoxDecoration(
                                                  //       color: Styles.white,
                                                  //       borderRadius:
                                                  //           BorderRadius
                                                  //               .circular(8),
                                                  //     ),
                                                  //     child: Padding(
                                                  //       padding:
                                                  //           const EdgeInsets
                                                  //               .symmetric(
                                                  //               horizontal: 20,
                                                  //               vertical: 15),
                                                  //       child: Column(
                                                  //         crossAxisAlignment: isSent
                                                  //             ? CrossAxisAlignment
                                                  //                 .end
                                                  //             : CrossAxisAlignment
                                                  //                 .start,
                                                  //         children: [
                                                  //           if (!isSent)
                                                  //             CustomTextWidget(
                                                  //               // textAlign:
                                                  //               //     TextAlign
                                                  //               //         .start,
                                                  //               text:
                                                  //                   userFireBaseModel!
                                                  //                       .name
                                                  //                       .trim()
                                                  //                       .split(
                                                  //                           ' ')
                                                  //                       .first,
                                                  //               fontSize: 13,
                                                  //               textAlign:
                                                  //                   TextAlign
                                                  //                       .start,
                                                  //               fontWeight:
                                                  //                   FontWeight
                                                  //                       .w600,
                                                  //               color: Styles
                                                  //                   .black,
                                                  //             ),
                                                  //           if (isSent)
                                                  //             const CustomTextWidget(
                                                  //               textAlign:
                                                  //                   TextAlign
                                                  //                       .start,
                                                  //               text: "You",
                                                  //               fontSize: 13,
                                                  //               fontWeight:
                                                  //                   FontWeight
                                                  //                       .w600,
                                                  //               color: Styles
                                                  //                   .black,
                                                  //             ),
                                                  //           const SizedBox(
                                                  //             height: 5,
                                                  //           ),
                                                  //           SizedBox(
                                                  //             width: 120,
                                                  //             child: Row(
                                                  //               mainAxisAlignment:
                                                  //                   MainAxisAlignment
                                                  //                       .spaceBetween,
                                                  //               children: [
                                                  //                 Image.asset(
                                                  //                   Styles.getIconImage(
                                                  //                       "voice_calling.png"),
                                                  //                   height: 25,
                                                  //                 ),
                                                  //                 const CustomTextWidget(
                                                  //                   text:
                                                  //                       "Voice Calling",
                                                  //                   fontSize:
                                                  //                       13,
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w500,
                                                  //                   color: Styles
                                                  //                       .black,
                                                  //                 ),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //   ),

                                                  if (message.type ==
                                                      MessageType.Text)
                                                    GestureDetector(
                                                      onLongPress: () async {
                                                        if (message
                                                            .text.isNotEmpty) {
                                                          try {
                                                            await Clipboard.setData(
                                                                ClipboardData(
                                                                    text: message
                                                                        .text));
                                                            ToastComponent()
                                                                .showToast(
                                                                    'Copied to clipboard');
                                                          } catch (e) {
                                                            debugPrint(
                                                                "error occurred in copying text to clipboard: $e");
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Styles.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 15),
                                                          child: Column(
                                                            crossAxisAlignment: isSent
                                                                ? CrossAxisAlignment
                                                                    .end
                                                                : CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (!isSent)
                                                                CustomTextWidget(
                                                                  // textAlign:
                                                                  //     TextAlign
                                                                  //         .start,
                                                                  text: userFireBaseModel!
                                                                      .name
                                                                      .trim()
                                                                      .split(
                                                                          ' ')
                                                                      .first,
                                                                  fontSize: 13,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Styles
                                                                      .black,
                                                                ),
                                                              if (isSent)
                                                                const CustomTextWidget(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  text: "You",
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Styles
                                                                      .black,
                                                                ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              // Linkify(
                                                              //   onOpen:
                                                              //       _onOpenLink,
                                                              //   text:
                                                              //       message.text,
                                                              // ),

                                                              CustomTextWidget(
                                                                text: message
                                                                    .text,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Styles
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (message.type ==
                                                      MessageType.Image)
                                                    message.mediaUrl == null
                                                        ? const SizedBox()
                                                        : GestureDetector(
                                                            onTap: () {
                                                              // Get.to(() =>
                                                              //     FullImageView(
                                                              //       mediaList:
                                                              //           message
                                                              //               .mediaUrl!,
                                                              //     ));
                                                            },
                                                            child: Container(
                                                              width:
                                                                  150, // Adjust the width as needed
                                                              height:
                                                                  150, // Adjust the height as needed
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(
                                                                      message
                                                                          .mediaUrl!),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  // Add a similar block for handling MessageType.Video if needed
                                                ],
                                              ),
                                            ),
                                            if (isSent)
                                              const SizedBox(width: 5),
                                            if (isSent)
                                              const CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage: NetworkImage(
                                                    "https://raysensenbach.com/wp-content/uploads/2013/04/default.jpg"),
                                                radius: 18.5,
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 55, top: 4, right: 55),
                                          child: Text(
                                            Styles.formatOnlyTime(
                                                    message.timestamp)
                                                .toString(),
                                            style: const TextStyle(
                                              color: Styles.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, _) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: messages.length,
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    height: controller.isKeyboardVisible ? 100 : 90,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: const BoxDecoration(
                        color: Styles.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 9,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: const Text('Select an Image'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        controller.galleryPick(
                                            "2",
                                            userFireBaseModel!.id,
                                            userFireBaseModel!);
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.photo,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                                controller.galleryPick(
                                                    Get.find<
                                                            LocalStorageService>()
                                                        .loginModel!
                                                        .data!
                                                        .user!
                                                        .id
                                                        .toString(),
                                                    userFireBaseModel!.id,
                                                    userFireBaseModel!);
                                              },
                                              child: const Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("dsfasdafasdfsa");
                                        Get.back();
                                        // Navigator.of(context).pop();
                                        controller.camPick(
                                            Get.find<LocalStorageService>()
                                                .loginModel!
                                                .data!
                                                .user!
                                                .id
                                                .toString(),
                                            userFireBaseModel!.id,
                                            userFireBaseModel!);
                                      },
                                      child: Container(
                                        width: Get.width,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.camera_alt,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                                controller.camPick(
                                                    Get.find<
                                                            LocalStorageService>()
                                                        .loginModel!
                                                        .data!
                                                        .user!
                                                        .id
                                                        .toString(),
                                                    userFireBaseModel!.id,
                                                    userFireBaseModel!);
                                              },
                                              child: const Text(
                                                'Camera',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // actions: [
                              ),
                            );
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF0A900)),
                            child: const Icon(
                              Icons.add,

                              color: Styles.white,

                              size: 17,

                              // weight: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffF4F4F4),
                                borderRadius: BorderRadius.circular(28)),

                            // Set the background color to grey

                            child: TextField(
                              controller: controller.chatMessage,
                              minLines: 1,
                              maxLines: 8,
                              decoration: const InputDecoration(
                                errorBorder: InputBorder.none,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Type your message...",
                              ),
                            ),
                          ),
                        ),
                        // if (controller.isKeyboardVisible)
                        const SizedBox(
                          width: 12,
                        ),
                        // if (controller.isKeyboardVisible)
                        GestureDetector(
                          onTap: () {
                            if (controller.chatMessage.text.trim().isNotEmpty) {
                              controller.sendMessage(
                                  Get.find<LocalStorageService>()
                                      .loginModel!
                                      .data!
                                      .user!
                                      .id
                                      .toString(),
                                  userFireBaseModel!.id,
                                  controller.chatMessage.text,
                                  null,
                                  MessageType.Text,
                                  userFireBaseModel!);
                              controller.chatMessage.clear();
                              controller.scrollDown();
                              controller.update();
                            }
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Styles.primaryColor),
                            child: const Icon(
                              Icons.send,
                              color: Styles.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
