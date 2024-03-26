// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/models/country_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/custom_snack_bar.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class CreateEmploymentController extends GetxController {
  TextEditingController projectTextEditingController = TextEditingController();
  TextEditingController titleTextEditingController = TextEditingController();
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
  FocusNode focusCdescr = FocusNode();
  CountryModelData countryModelData = CountryModelData();
  CountryModels country = CountryModels();

  bool obsecurePass = true;
  final bool _passwordVisible = true;
  bool rememberMe = false;
  bool checked = false;
  bool obsecureConfirmPass = true;
  bool _confirmPasswordVisible = true;
  String? selectedFile;
  final String _email = '';

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
      final result = await TaskRepositoryIml().createEmployment({
        "company_name": titleTextEditingController.text,
        "designation": projectTextEditingController.text,
        "end_date": endDateTextEditingController.text,
        "start_date": startDateTextEditingController.text,
        "country_id": countryModelData.id.toString(),
        "city": cPasswordTextEditingController.text,
        "description": descriptionTextEditingController.text,
        "is_working": checked == true ? "1 " : "0"
      });

      if (result['data'] != null) {
        ToastComponent().showToast("Employment Created");
        LoadingDialog.hide();
        // Get.back();
        Get.back();
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

  Future<void> getCountry() async {
    try {
      LoadingDialog.show();
      final result = await AuthenticationRepositoryIml().getCountry();

      if (result['data'] != null) {
        country = CountryModels.fromJson(result);
        countryModelData = country.data![0];
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
    getCountry();
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
