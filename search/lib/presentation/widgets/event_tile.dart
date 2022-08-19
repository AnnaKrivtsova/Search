import 'package:flutter/material.dart';
import 'package:search/domain/entities/event.dart';
import 'package:search/extensions/string_extension.dart';
import 'package:search/presentation/pages/details_page.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    required this.event,
    Key? key,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                event: event,
              ),
            ),
          ),
          child: ListTile(
            leading: event.image.isEmpty
                ? Container(
                    height: 100,
                    color: Colors.grey,
                    child: const Text('No image'),
                  )
                : Image.network(event.image),
            title: Text(event.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.dateTime.formatDateTime()),
                const SizedBox(height: 5),
                Text(event.location),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
