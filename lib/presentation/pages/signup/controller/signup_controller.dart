// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/models/country_model.dart';
import '../../../../data/models/login_model.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/custom_snack_bar.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class SignupController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController languageTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  String? selectedCountryCode;
  TextEditingController cPasswordTextEditingController =
      TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  List<String> selectedLanguage = [];
  bool buttonClicked = true;
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

  CountryModelData countryModelData = CountryModelData();

  CountryModels country = CountryModels();

  LoginModel loginModel = LoginModel();

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
    getCountry();
    //
    //TODO: implement onInit
    super.onInit();
  }

  Future<void> register() async {
    try {
      LoadingDialog.show();
      final result = await AuthenticationRepositoryIml().registerUser({
        "name": nameTextEditingController.text,
        "username": userNameTextEditingController.text,
        "password": passwordTextEditingController.text,
        "email": emailTextEditingController.text,
        "role_id": buttonClicked ? "3" : "2",
        "country_id": countryModelData.id.toString(),
        "phone": phoneTextEditingController.text,
      });

      if (result['token'] != null) {
        loginModel = LoginModel.fromJson(result);
        Get.find<LocalStorageService>().loginModel = loginModel;
        LoadingDialog.hide();
        if (loginModel.user!.roleId == 2) {
          Get.offAllNamed(Routes.teacherHome);
          // Get.toNamed(Routes.home);
        } else {
          Get.offAllNamed(Routes.home);
        }
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
