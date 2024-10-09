import 'dart:convert';

import 'package:task_management/data/providers/network/apis/task_api.dart';

import '../../domain/repositories/task_repository.dart';

class TaskRepositoryIml extends TaskRepository {
  @override
  Future<Map<String, dynamic>> applyProposal(
      Map<String, dynamic> data, String id) async {
    try {
      final response = await TaskAPI.uploadTask(data, id).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createEducation(
      Map<String, dynamic> data) async {
    try {
      final response = await TaskAPI.createTask(data, "education").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createEmployment(
      Map<String, dynamic> data) async {
    try {
      final response = await TaskAPI.createTask(data, "employement").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createTask(Map<String, dynamic> data) async {
    try {
      final response = await TaskAPI.createTask(data, "task/create").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteEducation(String id, String path) async {
    try {
      final response = await TaskAPI.deleteTask(id, path).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteTask(String id) async {
    try {
      final response = await TaskAPI.deleteTask(id, "task").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> fromPostData(
      Map<String, dynamic> data, String apiPath) async {
    try {
      final response = await TaskAPI.fromPostData(data, apiPath).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getAllPropsal(
      String apiPath, Map<String, dynamic> data) async {
    try {
      final response = await TaskAPI.getAllPropsal(apiPath, data).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getAllRequestTask(
      String apiPath, String id) async {
    try {
      final response = await TaskAPI.getAllRequestTask(apiPath, id).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getAllTeacher(String apiPath) async {
    try {
      final response = await TaskAPI.getListTask(apiPath, "").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getBestMatchTaskList() async {
    try {
      final response = await TaskAPI.getListTask("best-match", "").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getEduactionList() async {
    try {
      final response = await TaskAPI.getListTask("education", "").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getEmploymentList() async {
    try {
      final response = await TaskAPI.getListTask("employement", "").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getRecentTaskList(String path, String fitler,
      {String? type}) async {
    try {
      final response =
          await TaskAPI.getListTeacherTask(path, fitler, type: type).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getTaskList(String path, String filter) async {
    try {
      final response = await TaskAPI.getListTask(path, filter).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> postData(
      Map<String, dynamic> data, String apiPath) async {
    try {
      final response = await TaskAPI.postData(data, apiPath).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
