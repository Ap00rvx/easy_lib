part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

class GetAllBooks extends BooksEvent {}