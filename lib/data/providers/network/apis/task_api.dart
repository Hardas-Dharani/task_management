import 'package:get/get.dart';
import 'package:task_management/app/services/local_storage.dart';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class TaskAPI implements APIRequestRepresentable {
  final TaskType type;

  Map<String, dynamic>? data;
  String? id;
  String? paths;
  TaskAPI.createTask(Map<String, dynamic> data, String id)
      : this._(type: TaskType.createTask, data: data, id: id);
  TaskAPI.deleteTask(String id,String paths) : this._(type: TaskType.deleteTask, id: id,paths: paths);
  TaskAPI.getListTask(String id) : this._(type: TaskType.getListTask, id: id);
  TaskAPI.uploadTask(Map<String, dynamic> data, String? id)
      : this._(type: TaskType.uploadTask, data: data, id: id);
  TaskAPI._({required this.type, this.data, this.id,this.paths});

  @override
  get body {
    switch (type) {
      case TaskType.uploadTask:
        return data;
      case TaskType.createTask:
        return data;
      default:
        return "";
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String> get headers {
    switch (type) {
      case TaskType.getListTask:
        return {
          'Authorization':
              'Bearer ${Get.find<LocalStorageService>().loginModel!.token}'
        };

      default:
        return {
          'Authorization':
              'Bearer ${Get.find<LocalStorageService>().loginModel!.token}'
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case TaskType.getListTask:
        return HTTPMethod.get;
      case TaskType.deleteTask:
        return HTTPMethod.delete;

      default:
        return HTTPMethod.memberFormMethod;
    }
  }

  @override
  String get path {
    switch (type) {
      case TaskType.getListTask:
        return APIEndpoint.middlewareURl + id!;
      case TaskType.uploadTask:
        return "${APIEndpoint.middlewareURl}${APIEndpoint.createProposal}/$id";
      case TaskType.deleteTask:
        return "${APIEndpoint.middlewareURl}${APIEndpoint.taskList}/$id";
      case TaskType.createTask:
        return "${APIEndpoint.middlewareURl}$id";
      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams => {};

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum TaskType { createTask, deleteTask, getListTask, detailTask, uploadTask }
