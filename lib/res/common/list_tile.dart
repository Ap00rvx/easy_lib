import 'package:easy_lib/res/common/app_colors.dart';
import 'package:easy_lib/src/model/book_model.dart';
import 'package:flutter/material.dart';

final makeListTile = (Book book) =>  ListTile(
  enabled: book.available,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    // tileColor: Colors.r,

    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: const EdgeInsets.only(right: 12.0),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(width: 1.0, color: Colors.white24))),
      child:  Text(book.bookId,textAlign: TextAlign.center,style: TextStyle(
        fontWeight: book.available ? FontWeight.bold : FontWeight.normal
      ),),
    ),
    title:  Text(
      book.name,
      style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
    ),

    subtitle:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          child: Row(
            children: [
              Icon(Icons.linear_scale, color: book.available ? AppColors.positive:AppColors.red),
              Text(book.authorName, style: const TextStyle(color: AppColors.black)),
            ],
          ),
        ),
        Text(book.genre, style:  TextStyle(color: Colors.grey.shade500)),
      ],
    ),
    trailing:
    const Icon(Icons.keyboard_arrow_down, color:  AppColors.black, size: 30.0));
final customListTile =(Book book) => Card(
  elevation: 2,
  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.black.withOpacity(0.2)),
    child: makeListTile(book),
  ),
);