abstract class ApiObject {
  Map<String, dynamic>? toMap();
}

abstract class SingleListApiObject<T> extends ApiObject {
  List<T> asList();
}
