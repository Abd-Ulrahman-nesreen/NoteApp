import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/notes_provider.dart';

class HomeFAB extends StatelessWidget {
  const HomeFAB({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      showModalBottomSheet(context: context, builder: (context){
        NotesProvider notesProvider = Provider.of<NotesProvider>(context);
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Text("Add Task" , style: TextStyle(fontSize: 36 , color: Color(0xff606394)),),
              SizedBox(
                width: width * 0.8,
                child: TextField(
                  controller: notesProvider.noteController,
                  textAlign: TextAlign.center,
                  cursorColor: const Color(0xff229C8E),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xff229C8E)
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: width * 0.8,
                child: MaterialButton(onPressed: (){
                  notesProvider.addNotes(context);
                }, color: const Color(0xff229C8E), child: const Text("Add" , style: TextStyle(color: Colors.white),) ,),
              ),
            ],
          ),
        );
      });
    } , shape: const CircleBorder(), backgroundColor: const Color(0xff3F4B91), child: const Icon(CupertinoIcons.plus , color: Colors.white,),);
  }
}