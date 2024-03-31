// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_management/data/models/login_model.dart';
import 'package:task_management/presentation/pages/create_task/widget/share_user.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/models/get_all_teacher.dart';
import '../../../../data/repositories/task_repository.dart';
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

  final String _password = '';

  Country country = Country();

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
      final result = await TaskRepositoryIml().createTask({
        "title": titleTextEditingController.text,
        "word_count": wordCountText.text,
        "end_date": endDateTextEditingController.text,
        "start_date": startDateTextEditingController.text,
        "description": descriptionTextEditingController.text,
      });

      if (result['data'] != null) {
        ToastComponent().showToast("Task Createed");
        LoadingDialog.hide();
        Get.to(const ShareFriendDetailScreen());
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

  Future<void> sendRequestData(Map<String,dynamic> data) async {
    try {
      LoadingDialog.show();
      final result =
          await TaskRepositoryIml().postData(data, "task-request");

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

  bool getPasswordVisiblity() {
    return _passwordVisible;
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
