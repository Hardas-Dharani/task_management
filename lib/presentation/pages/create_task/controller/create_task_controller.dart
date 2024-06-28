// ignore_for_file: unused_field

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/models/get_all_teacher.dart';
import '../../../../data/models/pre_request_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/custom_snack_bar.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class CreateTaskController extends GetxController {
  TextEditingController projectTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController wordCountText = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController startDateTextEditingController =
      TextEditingController();
  TextEditingController endDateTextEditingController = TextEditingController();
  String? selectedCountryCode;
  TextEditingController cPasswordTextEditingController =
      TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  List<String> selectedLanguage = [];
  String buttonClicked = "Male";
  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusNumber = FocusNode();
  FocusNode focusLanguage = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusCpassword = FocusNode();
  bool obsecurePass = true;
  final bool _passwordVisible = true;
  bool rememberMe = false;
  bool obsecureConfirmPass = true;
  bool _confirmPasswordVisible = true;
  String? selectedFile;

  final String _email = '';
  File? image;

  final String _password = '';

  // Country country = Country();

  // // Country picker
  // Country? selectedCountryInfo;

  // void selectCountry(Country country) {
  //   selectedCountryInfo = country;
  //   numberTextEditingController.text = "+${country.phoneCode ?? "1"} ";
  //   update(); // Notify the UI that the selectedCountry has changed
  // }
  DateTime? selectedDate = DateTime.now();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  GetAllTeacher getAllTeachersModel = GetAllTeacher();

  List<File> listFileSelected = [];

  List<Teachers> selectedIdTeacher = [];
  PreRequestModel preRequestModel = PreRequestModel();
  Types preRequestModelTypes = Types();
  String get email => _email;
  String get password => _password;
  Future<void> camPick() async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      selectedFile = result.path;
      update();
    } else {
      CustomSnackBar.show('No Image picked');
    }
  }

  Future<void> createTask() async {
    try {
      LoadingDialog.show();
      List<String> ids = [];
      Map<String, int> teacher = {};

      // Populate the map with values from the list
      for (int i = 0; i < selectedIdTeacher.length; i++) {
        teacher["teachers[$i]"] = selectedIdTeacher[i].id!;
      }

      Map<String, dynamic> taskData = {
        "title": titleTextEditingController.text,
        "word_count":
            "${int.parse(wordCountText.text)} - ${int.parse(wordCountText.text) + 100}",
        "deadline": startDateTextEditingController.text,
        "description": descriptionTextEditingController.text,
        "files": listFileSelected,
        "type": preRequestModelTypes.id
      };

      // Add the teacher data to the task data
      teacher.forEach((key, value) {
        taskData[key] = value;
      });
      // selectedIdTeacher.asMap((e) => ids.add(e.id!));
      // ids.add(value)
      final result = await TaskRepositoryIml().createTask(taskData);

      if (result['status']) {
        ToastComponent().showToast("Task Createed");
        LoadingDialog.hide();
        Get.offNamed(Routes.home);
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  Future<void> galleryPick() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      selectedFile = result.path;
      update();
    } else {
      CustomSnackBar.show('No Image picked');
    }
  }

  Future<void> getAllTeacher() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().getAllTeacher("all-teachers");

      if (result['data'] != null) {
        // ToastComponent().showToast("Task Createed");
        LoadingDialog.hide();
        getAllTeachersModel = GetAllTeacher.fromJson(result);
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  double getFeeBasedOnWordCount(String wordCount) {
    final max = int.parse(wordCount.trim());

    if (max <= 800) {
      return 30.0;
    } else if (max <= 1200) {
      return 35.0;
    } else if (max <= 1600) {
      return 39.99;
    } else if (max <= 2000) {
      return 49.99;
    } else if (max <= 3000) {
      return 64.99;
    } else if (max <= 4000) {
      return 80.0;
    } else if (max <= 6000) {
      return 100.0;
    } else {
      return 0.0;
    }
  }

  bool getPasswordVisiblity() {
    return _passwordVisible;
  }

  Future<void> getTaskList(String filter) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().getTaskList("task/pre-req", filter);

      if (result['status'] != null) {
        preRequestModel = PreRequestModel.fromJson(result);
        if (preRequestModel.data != null) {
          preRequestModelTypes = preRequestModel.data!.types!.first;
        }
        LoadingDialog.hide();
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  @override
  void onClose() {
    focusName.removeListener(() {});
    focusEmail.removeListener(() {});
    focusNumber.removeListener(() {});
    focusLanguage.removeListener(() {});
    focusPassword.removeListener(() {});
    focusCpassword.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    //
    //TODO: implement onInit
    super.onInit();
    getTaskList("public");
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    update();
  }

  removeRememberMe() {
    LocalStorageService.removeString(
        key: SharedPreferenceConstant.rememberMeEmail);
    LocalStorageService.removeString(
        key: SharedPreferenceConstant.rememberMePass);
  }

  selecEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      endDateTextEditingController.text = _dateFormat.format(selectedDate!);
    }
    update();
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      startDateTextEditingController.text = _dateFormat.format(selectedDate!);
    }
    update();
  }

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      listFileSelected.add(file);
    } else {
      // User canceled the picker
    }
    update();
  }

  Future<void> sendRequestData(Map<String, dynamic> data) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().postData(data, "task-request");

      if (result['data'] != null) {
        // ToastComponent().showToast("Task Createed");
        LoadingDialog.hide();
        getAllTeachersModel = GetAllTeacher.fromJson(result);
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast("Sign in getting server error");
      LoadingDialog.hide();
    }
    update();
  }

  setConfirmObsecure() {
    obsecureConfirmPass = !obsecureConfirmPass;
    update();
  }

  setConfirmPasswordVisiblity(bool visible) {
    _confirmPasswordVisible = visible;
    update();
  }

  setObsecure() {
    obsecurePass = !obsecurePass;
    update();
  }

  setRememberVisiblity(bool visible) {
    rememberMe = visible;
    update();
  }

  void updateSelectedCountry(String country) {
    selectedCountryCode = country;
  }
}
