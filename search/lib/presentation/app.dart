import 'package:flutter/material.dart';
import 'package:search/presentation/pages/search_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SearchPage(),
    );
  }
}
