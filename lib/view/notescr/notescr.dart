
import 'package:flutter/material.dart';
import 'package:noteapp/controller/notescreen_controller.dart';
import 'package:noteapp/view/notescr/widget/notescard.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _date = TextEditingController();
  
  int slctdclrindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
      custombottomSheet(context: context);
      },
      child: Icon(Icons.add),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index)=> Notescard(
          title: NoteScreenController.noteslist[index]["title"],
          desc:  NoteScreenController.noteslist[index]["description"],
          date:  NoteScreenController.noteslist[index]["date"],
          clrindex: NoteScreenController.noteslist[index]["color"],
          onDelete: () {
            NoteScreenController.deletenote(index);
            setState(() {
              
            });
            
          },
          onEdit: () {
            custombottomSheet(context: context ,isedit: true);
            setState(() {
              
            });
          }
        ),
      separatorBuilder: (context,index)=>SizedBox(height: 10,),
      itemCount: NoteScreenController.noteslist.length,
      ),
    );
  }
  Future<dynamic> custombottomSheet({required BuildContext context, bool isedit = false}){
    return showModalBottomSheet(
          backgroundColor: Colors.amber,
          isScrollControlled: true,

          context: context, builder: (context)=> 
           StatefulBuilder(builder: (context, setState) {
              return Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text("Add Note"),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _title,
                  decoration: InputDecoration(
                    hintText: "Title",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                ), SizedBox(height: 10,),
                  TextFormField(
                    controller: _desc,
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
                    controller: _date,
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
                children: List.generate(4, (index) => InkWell(
                  onTap: (){
                    slctdclrindex = index;
                    print(slctdclrindex);
                    setState(() {
                      
                    });
                  },
                  child: Container(
                  height: 60, width: 60,decoration: BoxDecoration(border: Border.all(width: slctdclrindex == index ? 0 : 5,color: Colors.amber),   borderRadius: BorderRadius.circular(10),color: NoteScreenController.colorlist[index]),
                            ),
                ) ),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if(isedit == true){}
                      else{
                      NoteScreenController.addnote(
                        title: _title.text,
                        desc: _desc.text,
                        date: _date.text,
                        clrindex: slctdclrindex,
                        

                      );
                      }
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => NotesScreen()));
                      setState(() {
                        
                      });
                    },
                    child: Container(
                       width: 100,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(child: Text(isedit== true? "Edit" : "Save")),
                    ),
                  ),
                   InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                     child: Container(
                      width: 100,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(child: Text("Cancel ",style: TextStyle(color: Colors.red),)),
                                   ),
                   ),
                ],
              )
              ],
              ),
              ),
                      );
            }
          ));
      }
}

