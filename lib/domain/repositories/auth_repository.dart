abstract class AuthenticationRepository {
  Future<Map<String, dynamic>> getCountry();
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> data);
  Future<Map<String, dynamic>> signIn(String username, String password);
}
