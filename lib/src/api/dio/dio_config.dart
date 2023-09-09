import 'package:balanjo_app/src/utils/log.dart';
import 'package:dio/dio.dart';

import 'cache_interceptor.dart';

const url = "https://fhctyfdunjqeyabsjqal.supabase.co/rest/v1/";

Dio createDio({baseUrl = url}) {
  Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      baseUrl: baseUrl));
  return dio;
}

Dio addInterceptors({required Dio dio, bool isRequireAuth = true, Map<String,
    dynamic>? header}) {
  return dio
    ..interceptors.add(CustomInterceptors(header))
    ..interceptors.add(CacheInterceptor())
    ..transformer = MyTransformer();
}

class CustomInterceptors extends Interceptor {
  CustomInterceptors(this.header);

  final Map<String, dynamic>? header;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      "apikey":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZoY3R5ZmR1bmpxZXlhYnNqcWFsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MDQzMDc5MiwiZXhwIjoyMDA2MDA2NzkyfQ.LDYanw9nlI1bLXnTFIkezmH65dDiiG1kZTueqmZ1vw4",
      "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZoY3R5ZmR1bmpxZXlhYnNqcWFsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MDQzMDc5MiwiZXhwIjoyMDA2MDA2NzkyfQ.LDYanw9nlI1bLXnTFIkezmH65dDiiG1kZTueqmZ1vw4",
    };
    if (header != null) {
      options.headers.addAll(header!);
    }
    logDebug(
        tag: 'REQUEST[${options.method}] => PATH:',
        message: ' ${options.headers}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug(
        tag: 'RESPONSE[${response.statusCode}] => PATH:',
        message: ' ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    if (e.response != null) {
      logDebug(message: e.response?.data);
      logDebug(message: e.response?.headers);
      logDebug(message: "${e.response?.requestOptions}");
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      logDebug(message: e.requestOptions);
      logDebug(message: e.message);
    }
    return super.onError(e, handler);
  }
}

class MyTransformer extends BackgroundTransformer {
  @override
  Future<String> transformRequest(RequestOptions options) async {
    if (options.data is List<String>) {
      throw DioException(
        error: "Can't send List to sever directly",
        requestOptions: options,
      );
    } else {
      return super.transformRequest(options);
    }
  }
}
