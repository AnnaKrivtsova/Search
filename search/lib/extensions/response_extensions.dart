import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get _isStatusCodeSuccess {
    if (statusCode! >= 200 && statusCode! < 400) {
      return true;
    } else {
      return false;
    }
  }

  bool get isSuccess {
    if (_isStatusCodeSuccess && data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
