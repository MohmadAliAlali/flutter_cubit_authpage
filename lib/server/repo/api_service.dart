import 'package:dio/dio.dart';
import 'dio_provider.dart';

class ApiService {
  late final Dio _dio = buildDio();

  Future<List<dynamic>> getUsers() async {
    final response = await _dio.get('/users');
    return response.data as List<dynamic>;
  }

  // باقي ال methods مثال:
  Future<dynamic> login(String email, String pass) async =>
      (await _dio.post('/login', data: {'email': email, 'password': pass}))
          .data;
}