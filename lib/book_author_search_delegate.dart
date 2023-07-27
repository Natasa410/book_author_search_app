import 'package:book_authot_search_app/api_services.dart';
import 'package:flutter/material.dart';

class BookAuthorSearchDelegate extends SearchDelegate {
  // temp list to be replaced with the books found under each Author
  List<String> books = [
    'The fellowship of the ring',
    'the two towers',
    ' the return of the king'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    getAuthorsBooks() async {
      return await getAuthor(query);
    }

    if (query.isNotEmpty) {
      print(getAuthorsBooks());
    }

    for (var title in books) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getAuthorsBooks() async {
      return await getAuthor(query);
    }

    List<String> matchQuery = [];
    if (query.isNotEmpty) {
      print(getAuthorsBooks());
    }

    for (var title in books) {
      if (title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(title);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
