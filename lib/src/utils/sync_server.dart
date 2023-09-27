import 'log.dart';

syncData<R, EntityR, EntityL>(
    {required Future<EntityR> Function() request,
    required Future<EntityL> Function() local,
    required Function(EntityR) saveToLocal,
    required R Function(EntityL) mapper}) async {
  try {
    final networkData = await request();
    final localData = await local();
    if (networkData is List && localData is List) {
      if (networkData.isEmpty || networkData.length == localData.length) {
        return Result(data: mapper(localData), isLocal: false);
      } else {
        await saveToLocal(networkData);
        return Result(data: mapper(await local()), isLocal: true);
      }
    }
  } catch (e) {
    logDebug(message: e);
    return Result(data: <R>[], isLocal: true);
  }
}

class Result<T> {
  final T data;
  final bool isLocal;

  Result({required this.data, required this.isLocal});
}
