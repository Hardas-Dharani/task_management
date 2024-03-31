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
  TaskAPI.deleteTask(String id, String paths)
      : this._(type: TaskType.deleteTask, id: id, paths: paths);
  TaskAPI.fromPostData(Map<String, dynamic> data, String apiPath)
      : this._(type: TaskType.fromPostData, paths: apiPath, data: data);
  TaskAPI.getAllRequestTask(String apiPath, String id)
      : this._(type: TaskType.getAllTask, id: id, paths: apiPath);
  TaskAPI.getListTask(String id) : this._(type: TaskType.getListTask, id: id);
  TaskAPI.postData(Map<String, dynamic> data, String apiPath)
      : this._(type: TaskType.postData, paths: apiPath, data: data);
  TaskAPI.uploadTask(Map<String, dynamic> data, String? id)
      : this._(type: TaskType.uploadTask, data: data, id: id);
  TaskAPI._({required this.type, this.data, this.id, this.paths});

  @override
  get body {
    switch (type) {
      case TaskType.uploadTask:
        return data;
      case TaskType.createTask:
        return data;
      case TaskType.postData:
        return data;
      case TaskType.fromPostData:
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
      case TaskType.getAllTask:
        return HTTPMethod.get;
      case TaskType.deleteTask:
        return HTTPMethod.delete;
      case TaskType.postData:
        return HTTPMethod.post;
      case TaskType.fromPostData:
        return HTTPMethod.memberFormMethod;

      default:
        return HTTPMethod.memberFormMethod;
    }
  }

  @override
  String get path {
    switch (type) {
      case TaskType.getListTask:
        return APIEndpoint.middlewareURl + id!;
      case TaskType.getAllTask:
        return APIEndpoint.middlewareURl + paths!;
      case TaskType.uploadTask:
        return "${APIEndpoint.middlewareURl}${APIEndpoint.createProposal}/$id";
      case TaskType.deleteTask:
        return "${APIEndpoint.middlewareURl}${APIEndpoint.taskList}/$id";
      case TaskType.createTask:
        return "${APIEndpoint.middlewareURl}$id";
      case TaskType.postData:
        return "${APIEndpoint.middlewareURl}$path";
      case TaskType.fromPostData:
        return "${APIEndpoint.middlewareURl}$path";
      default:
        return "";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, dynamic>? get urlParams {
    switch (type) {
      case TaskType.getAllTask:
        return {'teacher_id': id};

      default:
        return {};
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}

enum TaskType {
  createTask,
  deleteTask,
  getListTask,
  getAllTask,
  postData,
  fromPostData,
  detailTask,
  uploadTask
}
