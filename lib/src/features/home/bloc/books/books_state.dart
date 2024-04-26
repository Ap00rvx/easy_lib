part of 'books_bloc.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

class BooksLoaded extends BooksState{
  final List<Book> books;

  BooksLoaded({required this.books});
}
class BooksLoading extends BooksState{}
class BooksError extends BooksState{
 final  String err;

  BooksError({required this.err});
}