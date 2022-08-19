import 'package:dio/dio.dart';
import 'package:search/data/interface/remote_data_source.dart';
import 'package:search/domain/entities/event.dart';
import 'package:search/domain/utils/wrapper.dart';
import 'package:search/extensions/string_extension.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final _dio = Dio();
  static const _clientId = 'Mjg1MDYxMDd8MTY2MDc1Nzk3MC42Mjc0NjY3';
  static const _baseUrl = 'https://api.seatgeek.com';

  RemoteDataSourceImpl() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.validateStatus = (_) => true;
  }

  @override
  Future<Wrapper<List<Event>>> fetchEventsList(String query) async {
    final formattedQuery = query.formatQuery();

    final response = await _dio.get(
      '/2/events',
      queryParameters: {
        'client_id': _clientId,
        'q': formattedQuery,
      },
    );
    final responseMap = Map<String, dynamic>.from(response.data);

    return Wrapper<EventsList>(
      data: EventsList.fromMap(responseMap['events']),
      status: response.statusCode ?? 500,
    ).convertList<Event>();
  }
}
