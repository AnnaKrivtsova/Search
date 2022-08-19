import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.onChanged,
    required this.searchController,
    Key? key,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search event',
            hintStyle: const TextStyle(color: Colors.white),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
              onPressed: searchController.clear,
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
