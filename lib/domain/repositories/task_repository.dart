abstract class TaskRepository {
  Future<Map<String, dynamic>> applyProposal(
      Map<String, dynamic> data, String id);
  Future<Map<String, dynamic>> createEducation(Map<String, dynamic> data);
  Future<Map<String, dynamic>> createEmployment(Map<String, dynamic> data);
  Future<Map<String, dynamic>> createTask(Map<String, dynamic> data);
  Future<Map<String, dynamic>> deleteEducation(String id, String path);
  Future<Map<String, dynamic>> deleteTask(String id);
  Future<Map<String, dynamic>> fromPostData(
      Map<String, dynamic> data, String apiPath);
  Future<Map<String, dynamic>> getAllRequestTask(String apiPath, String id);
  Future<Map<String, dynamic>> getAllTeacher(String apiPath);
  Future<Map<String, dynamic>> getBestMatchTaskList();
  Future<Map<String, dynamic>> getEduactionList();
  Future<Map<String, dynamic>> getEmploymentList();
  Future<Map<String, dynamic>> getRecentTaskList();
  Future<Map<String, dynamic>> getTaskList();
  Future<Map<String, dynamic>> postData(
      Map<String, dynamic> data, String apiPath);
}
