import 'package:flutter/material.dart';
import 'package:search/data/remote_data_source_impl.dart';
import 'package:search/domain/entities/event.dart';
import 'package:search/presentation/widgets/event_tile.dart';
import 'package:search/presentation/widgets/search_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final dataSource = RemoteDataSourceImpl();
  var items = <Event>[];

  Future<void> search(String query) async {
    final eventsList = await dataSource.fetchEventsList(query);

    if (query.isNotEmpty) {
      setState(() {
        items.clear();
        items.addAll(eventsList.data ?? []);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchTextField(
              onChanged: search,
              searchController: _searchController,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return EventTile(
                    event: items[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
