// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/data/models/education_model.dart';

import '../../../../data/models/emploment_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/custom_snack_bar.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class EditProfileController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController languageTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  final editProfileFormKey = GlobalKey<FormState>();
  List<String> selectedLanguage = [];

  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusNumber = FocusNode();
  FocusNode focusLanguage = FocusNode();
  FocusNode focusCountry = FocusNode();

  var selectedCountry = "".obs;

  String? selectedFile;

  EmploymentModel employmentModel = EmploymentModel();

  EducationModel educationModel = EducationModel();
  final String _email = '';

  String get email => _email;
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

  Future<void> getEduactionModel() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().getEduactionList();

      if (result['data'] != null) {
        educationModel = EducationModel.fromJson(result);
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

  Future<void> getEmploymentModel() async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().getEmploymentList();

      if (result['data'] != null) {
        employmentModel = EmploymentModel.fromJson(result);
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
    focusCountry.removeListener(() {});
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    numberTextEditingController.text = "+1";
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
    focusCountry.addListener(() {
      update();
    });
    
    //
    //TODO: implement onInit
    super.onInit();
  }

  void updateSelectedCountry(String country) {
    selectedCountry.value = country;
  }
}
