import 'package:book_authot_search_app/API_services.dart';
import 'package:flutter/material.dart';
import 'book_author_search_delegate.dart';

class BookAuthorSearch extends StatefulWidget {
  const BookAuthorSearch({Key? key}) : super(key: key);

  @override
  State<BookAuthorSearch> createState() => _BookAuthorSearch();
}

class _BookAuthorSearch extends State<BookAuthorSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Author Search ",
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: BookAuthorSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
