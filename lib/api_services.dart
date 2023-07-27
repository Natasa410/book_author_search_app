import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getAuthor(String authorName) async {
  List<dynamic> results = [];

  var uri =
      Uri.parse('https://openlibrary.org/search/authors.json?q=$authorName');
  var response = await http.get(uri);
  try {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      if (data['results'] != null) {
        results = data['results'];
      }
    } else {
      print('network error');
    }
  } on Exception catch (e) {
    print('error: $e');
  }
  if (results.isNotEmpty) {
    print('results');
  }
  return results;
}
