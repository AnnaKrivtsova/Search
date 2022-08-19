import 'package:search/domain/entities/event.dart';
import 'package:search/domain/utils/wrapper.dart';

abstract class RemoteDataSource {
  Future<Wrapper<List<Event>>> fetchEventsList(String query);
}
