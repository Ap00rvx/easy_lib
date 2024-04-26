import 'package:easy_lib/res/common/app_colors.dart';
import 'package:easy_lib/src/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final makeListTile = (Book book) =>  ExpansionTile(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
  children: [
    Row(
      children: [
        SizedBox(
          width: 10,
        ),

        Container(
            padding: const EdgeInsets.only(right: 12.0),
            child:   Padding(
padding: const EdgeInsets.all(10.0),
child: RotatedBox(quarterTurns: 3,child: Column(
children: [
Text("Price",style: TextStyle(color: AppColors.neutral),),
Text(book.price.toString(),style: TextStyle(
  color: book.available ? AppColors.black:Colors.grey.withOpacity(0.4)
),),
],
),),
),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24)))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(book.description,style: TextStyle(
            color: book.available ? AppColors.black:Colors.grey.withOpacity(0.4)
          ),),
        ),

      ],
    ),
    const SizedBox(
      height: 30,
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Published on -"+DateFormat("dd/MM/yyyy").format(book.publishedDate).toString(),style: TextStyle(
            color:book.available ? AppColors.black:Colors.grey.withOpacity(0.4), fontWeight: FontWeight.w200,fontSize: 10)
          ),
          Text(book.available?"Available for issue" :"Issued to uid -"+ book.issuedTo.toString(),style: TextStyle(
            color:book.available ? AppColors.positive :AppColors.red.withOpacity(0.2), fontWeight: FontWeight.w200)
          ),
        ],
      ),
    ),

  ],
    leading: Container(
      padding: const EdgeInsets.only(right: 12.0),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(width: 1.0, color: Colors.white24))),
      child:  Text(book.bookId,textAlign: TextAlign.center,style: TextStyle(
        fontWeight: book.available ? FontWeight.bold : FontWeight.normal,color: book.available ? AppColors.black:Colors.grey.withOpacity(0.4)
      ),),
    ),
    title:  Text(
      book.name,
      style:  TextStyle(color: book.available ? AppColors.black:Colors.grey.withOpacity(0.4), fontWeight: FontWeight.bold),
    ),
    subtitle:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          child: Row(
            children: [
              Icon(Icons.linear_scale, color: book.available ? AppColors.positive:AppColors.red.withOpacity(0.2)),
              Text(book.authorName, style:  TextStyle(color:book.available ? AppColors.black:Colors.grey.withOpacity(0.4))),
            ],
          ),
        ),
        Text(book.available ? book.genre:"Not Available",  style:  TextStyle(color: Colors.grey.shade500)),

      ],
    ));

final customListTile =(Book book) => Card(
  elevation: 2,
  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: book.available ? AppColors.black.withOpacity(0.2):Colors.grey.withOpacity(0.3)),
    child: makeListTile(book),
  ),
);