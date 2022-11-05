import 'package:retrofit/dio.dart';
import 'package:test_cats_app/data/dio/rest_client.dart';

class DataProviderImpl implements DataProvider {
  DataProviderImpl(this.client);

  @override
  late final RestClient client;

  @override
  Future<HttpResponse> fetchRandomCatFact() {
    return client.getRandomCatFact();
  }

  @override
  Future<HttpResponse> fetchRandomCatImage() async {
    return client.getRandomCatImage();
  }
}

abstract class DataProvider {
  late final RestClient client;

  Future<HttpResponse> fetchRandomCatFact();
  Future<HttpResponse> fetchRandomCatImage();
}
