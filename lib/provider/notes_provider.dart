import 'package:flutter/material.dart';
import 'package:note_app/models/notes.dart';

class NotesProvider extends ChangeNotifier {
  List<Notes> notes = [
    Notes(note: "note", state: false)
  ];

  TextEditingController noteController = TextEditingController();


  void addNotes (BuildContext context){
    if (noteController.text.isNotEmpty){
      notes.add(Notes(note: noteController.text, state: false));
      noteController.clear();
      Navigator.of(context).pop();
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("لا يمكن إضافة ملاحظة فارغة")));
    }
    notifyListeners();
  }

  void deleteNotes ({required int index}){
    notes.removeAt(index);
    notifyListeners();
  }

  void completeTheNote({required int index}){
    notes[index] = Notes(note: notes[index].note, state: !notes[index].state);
    notifyListeners();
  }
}