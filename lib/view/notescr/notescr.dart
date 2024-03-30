import 'package:flutter/material.dart';
import 'package:noteapp/view/notescr/widget/notescard.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.amber,
          isScrollControlled: true,

          context: context, builder: (context)=> Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Text("Add Note"),
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "Title",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            ), SizedBox(height: 10,),
              TextFormField(
                maxLines: 4,
              decoration: InputDecoration(
                hintText: "Description",
                filled: true,
                
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            ), SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "Date",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  
                ),
                suffixIcon: InkWell(onTap: () {
                  
                },child: Icon(Icons.date_range_rounded)),
          ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) => Container(
            height: 60, width: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
          ) ),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text("Save"),
              ),
               InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                 child: Container(
                  child: Text("Cancel ",style: TextStyle(color: Colors.red),),
                               ),
               ),
            ],
          )
          ],
          ),
          ),
        ));
      },
      child: Icon(Icons.add),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index)=> Notescard(),
      separatorBuilder: (context,index)=>SizedBox(height: 10,),
      itemCount: 10,
      ),
    );
  }
}

