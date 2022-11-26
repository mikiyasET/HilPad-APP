import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,  top: 20),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          //fillColor: Colors.grey.withOpacity(0.05),
          fillColor: Theme.of(context).backgroundColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
