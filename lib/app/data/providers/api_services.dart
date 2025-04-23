import 'package:dio/dio.dart';


import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://dummyjson.com/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  static Dio get dio => _dio;
}
