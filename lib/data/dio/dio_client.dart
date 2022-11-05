import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(BaseOptions(responseType: ResponseType.bytes));
}
