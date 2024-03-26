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
      final response = await TaskAPI.createTask(data, "task").request();

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
  Future<Map<String, dynamic>> getBestMatchTaskList() async {
    try {
      final response = await TaskAPI.getListTask("best-match").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getEduactionList() async {
    try {
      final response = await TaskAPI.getListTask("education").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getEmploymentList() async {
    try {
      final response = await TaskAPI.getListTask("employement").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getRecentTaskList() async {
    try {
      final response = await TaskAPI.getListTask("most-recent").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getTaskList() async {
    try {
      final response = await TaskAPI.getListTask("task").request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
