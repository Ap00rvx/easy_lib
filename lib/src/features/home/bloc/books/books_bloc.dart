import 'package:bloc/bloc.dart';
import 'package:easy_lib/locator.dart';
import 'package:easy_lib/src/features/home/repository/books_repository.dart';
import 'package:easy_lib/src/model/book_model.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()) {
  on<GetAllBooks>((event, emit) async{
    emit(BooksLoading());
    try {
      final books = await locator.get<BooksRepository>().getAllBooks();
      emit(BooksLoaded(books: books));
    }catch (err){
      emit(BooksError(err: err.toString()));
    }
  });
  }
}
