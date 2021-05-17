import 'dart:ffi';

import 'package:CWCFlutter/retrofit/models/test_model.dart';
import 'package:dio/dio.dart' hide Headers;

import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

// class Apis {
//   static const String test1 = '/test';
// }

@RestApi(baseUrl: 'https://us-central1-gg-football.cloudfunctions.net/api')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/test")
  Future<Void> getTest1();
}
