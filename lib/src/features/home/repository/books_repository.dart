
import 'dart:convert';

import 'package:easy_lib/res/utils/urls.dart';
import 'package:easy_lib/src/model/book_model.dart';
import 'package:http/http.dart' as http;
class BooksRepository{
  late List<Book> _books ;
  Future<List<Book>> getAllBooks ()async {
    try {
      final response = await http.get(Uri.parse("${HOST_URI}books/"));
      final json = jsonDecode(response.body);
      if (json['status'] == "success"){
        final booksJson = json['books'] as List;
        _books =[];
        for(var bookJson in booksJson){
            final book = Book.fromJson(bookJson);
            _books.add(book);
        }
        return _books ;
      }
      else{
        return [];
      }

  }catch(err){
      print(err);
      return [];
    }
  }
  List<Book> get books => _books;
}