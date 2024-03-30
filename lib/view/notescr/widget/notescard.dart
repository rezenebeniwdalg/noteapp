import 'package:flutter/material.dart';

class Notescard extends StatelessWidget {
  const Notescard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("title"),
        Row(
          children: [
            Icon(Icons.edit),
            SizedBox(width: 15,),
            Icon(Icons.delete),
            ],),],
    ),
    SizedBox(height: 5,),
    Text("description"),
      SizedBox(height: 5,),
      Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [Text("date"),
      SizedBox(width: 20,),
      Icon(Icons.share),],)
          ],),
          );
  }
}