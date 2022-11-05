import 'package:dio/dio.dart' as dioI;
import 'package:retrofit/retrofit.dart';

import '../constants.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(dioI.Dio dio) = _RestClient;

  @GET(catImageUrl)
  Future<HttpResponse> getRandomCatImage();

  @GET(catFactUrl)
  Future<HttpResponse> getRandomCatFact();
}
