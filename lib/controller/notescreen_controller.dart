import 'package:flutter/material.dart';
import 'package:noteapp/core/constants/clrconst.dart';

class NoteScreenController{
  static List noteslist = [];

static List<Color> colorlist= [
  Clrs.blue,
  Clrs.green,
  Clrs.red,
  Clrs.yellow
];

static void addnote(
  {
    required String title,required String desc, required String date,int clrindex = 0,
  }
){
  noteslist.add({
"title":title,
"description":desc,
"date":date,
"color": clrindex,
  });
}
static void  deletenote(int index){
  noteslist.removeAt(index);
}
static void editnote({required int index,
required String title,
required String desc,
 required String date,
 int clrindex = 0,}){
  noteslist[index] = {"title":title,
"description":desc,
"date":date,
"color": clrindex,};
}

}