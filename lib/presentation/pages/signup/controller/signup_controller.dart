// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/services/local_storage.dart';
import '../../../../app/services/shared_preferance_constants.dart';
import '../../../../data/models/country_model.dart';
import '../../../../data/models/login_model.dart';
import '../../../../data/models/user_firebase.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/repositories/user_repository_impl.dart';
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
  late ImagePicker picker;
  late XFile? image;
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

  final UserRepository _userRepository = UserRepository();

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
      ToastComponent().showToast(e.toString());
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
    // getCountry();
    //
    //TODO: implement onInit
    super.onInit();
  }

  Future<void> register() async {
    try {
      LoadingDialog.show();
      final result = await AuthenticationRepositoryIml().registerUser({
        "name": userNameTextEditingController.text,
        "password": passwordTextEditingController.text,
        "email": emailTextEditingController.text,
        "type": buttonClicked ? "student" : "teacher",
      });

      if (result['status']) {
        loginModel = LoginModel.fromJson(result);
        if (loginModel.data?.user?.approvalStatus != "pending") {
          Get.find<LocalStorageService>().loginModel = loginModel;
          UserFireBaseModel userFireBaseModel = UserFireBaseModel(
              id: loginModel.data!.user!.id.toString(),
              name: loginModel.data!.user!.name.toString(),
              isOnline: true,
              profilePictureUrl: loginModel.data!.user!.imageUrl.toString(),
              lastSeen: {});
          await _userRepository.addUser(userFireBaseModel);
          LoadingDialog.hide();
          if (loginModel.data!.user!.roleId == 2) {
            Get.offAllNamed(Routes.home);
            // Get.toNamed(Routes.home);
          } else {
            Get.offAllNamed(Routes.teacherHome);
          }
        } else {
          LoadingDialog.hide();
          ToastComponent().showToast(result['message'] + "Wait for approval");
          Get.back();
        }
      } else {
        ToastComponent().showToast(result['message']);
        LoadingDialog.hide();
      }
    } catch (e) {
      print(e.toString());
      ToastComponent().showToast(e.toString());
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
