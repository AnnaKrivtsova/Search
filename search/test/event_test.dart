import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search/domain/entities/event.dart';

import 'package:search/presentation/widgets/event_tile.dart';

void main() {
  test('empty EventTile test', () async {
    const event = Event.empty();

    expect(event.id, 0);
    expect(event.title, '');
    expect(event.dateTime, '');
    expect(event.image, '');
    expect(event.location, '');
  });

  test('EventTile test', () async {
    const event = Event(
      id: 1,
      title: 'Concert',
      dateTime: '2022-01-01',
      location: 'Tbilisi',
      image: 'img.png',
    );
    // await tester.pumpWidget(const EventTile(
    //   event: Event.empty(),
    // ));

    expect(event.id, 1);
    expect(event.title, 'title');
    expect(event.dateTime, '2022-01-01');
    expect(event.image, 'Tbilisi');
    expect(event.location, 'img.png');
  });
}
