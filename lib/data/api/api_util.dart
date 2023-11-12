import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';
import '../../utils/data_state.dart';


abstract class ApiUtil {
  @protected
  Future<DataState<T>> getDataFromApi<T, D>(
      {required Future<HttpResponse<D>> Function() request,
      required T Function(D) mapper}) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(mapper(httpResponse.data));
      } else {
        throw DioException(
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions);
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
