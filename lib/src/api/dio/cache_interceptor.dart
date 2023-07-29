import 'package:balanjo_app/src/utils/log.dart';
import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  final _cache = <Uri, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var response = _cache[options.uri];
    if (options.extra['refresh'] == true) {
      logDebug(tag: '${options.uri}:', message:' force refresh, ignore cache! \n');
      return handler.next(options);
    } else if (response != null) {
      logDebug(tag: 'cache hit:', message:'${options.uri} \n');
      return handler.resolve(response);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri] = response;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

    super.onError(err, handler);
  }
}
