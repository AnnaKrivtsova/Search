import 'package:equatable/equatable.dart';
import 'package:search/domain/utils/api_object.dart';

class Wrapper<T> extends Equatable {
  final T? data;
  final int status;

  static const int statusError = 500;

  const Wrapper({this.data, this.status = 200});

  bool get isSuccess => status >= 200 && status < 400;

  @override
  List<Object?> get props => [data, status];

  Wrapper<List<E>> convertList<E extends ApiObject>() {
    return (isSuccess && data is SingleListApiObject)
        ? Wrapper(
            data: (data as SingleListApiObject).asList() as List<E>?,
            status: status,
          )
        : const Wrapper(
            data: null,
            status: statusError,
          );
  }
}
