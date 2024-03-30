import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';
import 'package:task_management/components/custom_text_component.dart';
import 'package:task_management/routes/app_routes.dart';
import 'package:task_management/utils/styles.dart';

import '../../../../components/earning_chart.dart';

class CustomAdminDrawer extends StatelessWidget {
  const CustomAdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Drawer(
        backgroundColor: Styles.black,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: CustomTextWidget(
                text: "admin",
                color: Styles.white,
              ),
              accountEmail: CustomTextWidget(
                text: "admin@gmail.com",
                color: Styles.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                // Replace with your image
                radius: 30.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_2,
                color: Styles.orangeYellow,
              ),
              title: const CustomTextWidget(
                text: "Users",
                color: Styles.white,
              ),
              onTap: () {
                Get.back();
                Get.back();

                // Handle item 1 tap
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Styles.orangeYellow,
              ),
              title: const CustomTextWidget(
                text: "Settings",
                color: Styles.white,
              ),
              onTap: () {
                Get.toNamed(Routes.settings);
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_page_outlined,
                color: Styles.orangeYellow,
              ),
              title: const CustomTextWidget(
                text: "Statistics",
                color: Styles.white,
              ),
              onTap: () {
                Get.to(const LineChartSample1());
                // Handle item 1 tap
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Styles.orangeYellow,
              ),
              title: const CustomTextWidget(
                text: "Logout",
                color: Styles.white,
              ),
              onTap: () {
                Get.find<LocalStorageService>().loginModel = null;
                Get.toNamed(Routes.signin);
                // Handle item 1 tap
              },
            ),
            // Add more ListTile items as needed
          ],
        ),
      ),
    );
  }
}
