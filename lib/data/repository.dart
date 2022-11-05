import 'package:retrofit/dio.dart';

import 'data_provider.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this.dataProvider);

  @override
  late final DataProvider dataProvider;

  @override
  Future<HttpResponse> getRandomCatFact() {
    return dataProvider.fetchRandomCatFact();
  }

  @override
  Future<HttpResponse> getRandomCatImage() {
    return dataProvider.fetchRandomCatImage();
  }
}

abstract class Repository {
  late final DataProvider dataProvider;

  Future<HttpResponse> getRandomCatFact();
  Future<HttpResponse> getRandomCatImage();
}
