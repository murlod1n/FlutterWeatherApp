

import 'package:dio/dio.dart';


abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({required this.data, required this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data, error: null);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error, data: null);
}