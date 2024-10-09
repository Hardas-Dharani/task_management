import 'dart:convert';

import '../../domain/repositories/auth_repository.dart';
import '../providers/network/apis/auth_api.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<Map<String, dynamic>> getCountry() async {
    try {
      final response = await AuthAPI.getCountry().request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> data) async {
    // TODO: implement registerUser
    try {
      final response = await AuthAPI.register(data).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> signIn(
      String username, String password, String typeUser) async {
    try {
      final response =
          await AuthAPI.login(username, password, typeUser).request();

      final result = json.decode(response);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
