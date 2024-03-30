import 'package:flutter/material.dart';
import 'package:noteapp/controller/notescreen_controller.dart';
import 'package:noteapp/core/constants/clrconst.dart';
import 'package:share_plus/share_plus.dart';

class Notescard extends StatelessWidget {
  const Notescard({
    super.key, required this.clrindex,required this.date,required this.desc,required this.title,required this.onDelete,required this.onEdit,
  });

final String title;
final String desc;
final String date;
final int clrindex;
final void Function()? onDelete;
final void Function()? onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    decoration: BoxDecoration(color: NoteScreenController.colorlist[clrindex],borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Row(
          children: [
            InkWell(
              onTap: onEdit,
              child: Icon(Icons.edit)),
            SizedBox(width: 15,),
            InkWell(
              onTap: onDelete,
              child: Icon(Icons.delete)),
            ],),],
    ),
    SizedBox(height: 5,),
    Text(desc),
      SizedBox(height: 5,),
      Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [Text(date),
      SizedBox(width: 20,),
       InkWell(
            onTap:(){
              Share.share("$title , $desc");
            },
            child: Icon(Icons.share))],)
          ],),
          );
  }
}