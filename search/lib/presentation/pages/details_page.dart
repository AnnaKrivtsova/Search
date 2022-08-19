import 'package:flutter/material.dart';
import 'package:search/domain/entities/event.dart';
import 'package:search/extensions/string_extension.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.event,
    Key? key,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          event.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            event.image.isEmpty
                ? Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    child: const Text('No image'),
                  )
                : Image.network(event.image),
            const SizedBox(height: 5),
            Text(
              event.dateTime.formatDateTime(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(event.location),
          ],
        ),
      ),
    );
  }
}
