// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/education_model.dart';
import '../../../../data/models/emploment_model.dart';
import '../../../../data/repositories/task_repository.dart';
import '../../../../utils/custom_snack_bar.dart';
import '../../../../utils/loader.dart';
import '../../../../utils/toast_component.dart';

class TeacherProfileController extends GetxController {
  List<String> labels = [
    'Graduate',
    'Teacher',
    'Professional',
    'Content Writing',
    'Professional',
  ];

  var selectedCountry = "".obs;

  String? selectedFile;

  final String _email = '';

  EmploymentModel employmentModel = EmploymentModel();

  EducationModel educationModel = EducationModel();

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

  Future<void> deleteTask(String id, String path) async {
    try {
      LoadingDialog.show();
      final result = await TaskRepositoryIml().deleteEducation(id, path);

      if (result['status_code'] == 200) {
        await getEduactionModel();
        await getEmploymentModel();
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
      ToastComponent().showToast(e.toString());
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
      ToastComponent().showToast(e.toString());
      LoadingDialog.hide();
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getEmploymentModel();
    getEduactionModel();
    super.onInit();
  }

  void updateSelectedCountry(String country) {
    selectedCountry.value = country;
  }
}
