import 'package:get_it/get_it.dart';
import 'package:test_cats_app/data/dio/dio_client.dart';

import '../dio/rest_client.dart';

class ServiceLocator {
  late final GetIt _getIt;

  ServiceLocator() : _getIt = GetIt.instance;

  void setup() {
    _getIt.registerSingleton<DioClient>(DioClient());
    _getIt.registerSingleton<RestClient>(
      RestClient(_getIt.get<DioClient>().dio),
    );
  }
}
