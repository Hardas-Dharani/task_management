// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/firebase_options.dart';

import 'app/services/local_storage.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initServices();
  runApp(const MainApp());
}

initServices() async {
  if (kDebugMode) {
    print('starting services ...');
  }
  await Get.putAsync(() => LocalStorageService().init());
  if (kDebugMode) {
    print('All services started...');
  }
}
