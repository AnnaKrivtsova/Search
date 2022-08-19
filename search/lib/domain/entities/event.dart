import 'package:equatable/equatable.dart';
import 'package:search/domain/utils/api_object.dart';

class Event extends Equatable implements ApiObject {
  final int id;
  final String title;
  final String dateTime;
  final String location;
  final String image;

  const Event({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.location,
    required this.image,
  });

  const Event.empty({
    int id = 0,
    String title = '',
    String dateTime = '',
    String location = '',
    String image = '',
  }) : this(
          id: id,
          title: title,
          dateTime: dateTime,
          location: location,
          image: image,
        );

  Event copyWith({
    int? id,
    String? title,
    String? dateTime,
    String? location,
    String? image,
  }) =>
      Event(
        id: id ?? this.id,
        title: title ?? this.title,
        dateTime: dateTime ?? this.dateTime,
        location: location ?? this.location,
        image: image ?? this.image,
      );

  @override
  factory Event.fromJson(Map<String, dynamic> json) {
    final venueMap = Map<String, dynamic>.from(json['venue']);
    final performersMap = Map<String, dynamic>.from((json['performers'] as List<dynamic>).first);

    return Event(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      dateTime: json['datetime_utc'] ?? '',
      location: venueMap['display_location'] ?? '',
      image: performersMap['image'] ?? '',
    );
  }

  @override
  Map<String, dynamic>? toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime,
      'location': location,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        dateTime,
        location,
        image,
      ];
}

class EventsList extends SingleListApiObject<Event> {
  final Iterable<Event> _results;

  factory EventsList.fromMap(List<dynamic> jsonMaps) {
    final results = <Event>[];
    for (final jsonMap in jsonMaps) {
      final json = Map<String, dynamic>.from(jsonMap);
      results.add(Event.fromJson(json));
    }
    return EventsList(results);
  }

  EventsList(this._results);

  @override
  Map<String, dynamic> toMap() {
    return {
      'events': _results.map((alert) => alert.toMap()).toList(),
    };
  }

  @override
  List<Event> asList() {
    return _results.toList();
  }
}
