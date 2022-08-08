import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../model/response_model.dart';

class ApiClient {
  final Dio _dioClient = Dio();

  static const TIME_OUT_DURATION = 30;

  Future<dynamic> getRequest(String url) async {
    try {
      Response serverResponse = await _dioClient
          .get(url)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      return ApiResponseModel(serverResponse.data);
    } on DioError catch (e) {
      debugPrint("status code : ${e.response?.statusCode.toString()}");
      throw Exception("failed to load api");
    }
  }
}

final apiClient = ApiClient();
