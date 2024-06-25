// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/data/models/login_model.dart';
import 'package:task_management/data/repositories/task_repository.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/models/profile_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../utils/custom_snack_bar.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class CreateProfileController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController collageTextEditingController = TextEditingController();
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController languageTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController aboutTextEditingController = TextEditingController();
  String? selectedCountryCode;
  TextEditingController cPasswordTextEditingController =
      TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  List<String> selectedLanguage = [];
  String buttonClicked = "Male";
  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusUserName = FocusNode();
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

  // Country country = Country();

  ProfileModel profileModelData = ProfileModel();

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
        // country = Country.fromJson(result);

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

  Future<void> getProfileDetail() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().getAllTeacher("profile");

      if (result['data'] != null) {
        profileModelData = ProfileModel.fromJson(result);
        nameTextEditingController.text = profileModelData.data!.name!;
        fullNameTextEditingController.text = profileModelData.data!.username!;
        emailTextEditingController.text = profileModelData.data!.email!;
        aboutTextEditingController.text = profileModelData.data!.aboutMe!;
        buttonClicked = profileModelData.data!.gender!.toLowerCase() == "male"
            ? "Male"
            : "Female";
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

  getRememberMe() {
    rememberMe =
        LocalStorageService.getBool(key: SharedPreferenceConstant.rememberMe) ??
            false;
    if (kDebugMode) {
      print('getting data');
    }
    if (kDebugMode) {
      print('getting data $rememberMe');
    }

    if (rememberMe) {
      emailTextEditingController.text = LocalStorageService.getString(
              key: SharedPreferenceConstant.rememberMeEmail) ??
          '';

      passwordTextEditingController.text = LocalStorageService.getString(
              key: SharedPreferenceConstant.rememberMePass) ??
          '';
    }
  }

  bool getRememberVisiblity() {
    return rememberMe;
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
    numberTextEditingController.text = selectedCountryCode ?? "+1";
    getRememberMe();
    focusName.addListener(() {
      update();
    });
    focusEmail.addListener(() {
      update();
    });
    focusNumber.addListener(() {
      update();
    });
    focusLanguage.addListener(() {
      update();
    });
    focusPassword.addListener(() {
      update();
    });
    focusCpassword.addListener(() {
      update();
    });
    //
    //TODO: implement onInit
    super.onInit();
  }

  Future<void> register() async {
    try {
      LoadingDialog.show();
      final result = await AuthenticationRepositoryIml().registerUser({
        "name": "",
        "username": "",
        "password": "",
        "email": "",
        "role_id": "",
        "country_id": "",
        "phone": "",
      });

      if (result['data'] != null) {
        // country = Country.fromJson(result);

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

  // // Country picker
  // Country? selectedCountryInfo;

  // void selectCountry(Country country) {
  //   selectedCountryInfo = country;
  //   numberTextEditingController.text = "+${country.phoneCode ?? "1"} ";
  //   update(); // Notify the UI that the selectedCountry has changed
  // }

  removeRememberMe() {
    LocalStorageService.removeString(
        key: SharedPreferenceConstant.rememberMeEmail);
    LocalStorageService.removeString(
        key: SharedPreferenceConstant.rememberMePass);
  }

  saveRememberMe() {
    LocalStorageService.setString(
        value: emailTextEditingController.text,
        key: SharedPreferenceConstant.rememberMeEmail);
    LocalStorageService.setString(
        value: passwordTextEditingController.text,
        key: SharedPreferenceConstant.rememberMePass);
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
