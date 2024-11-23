import 'package:flutter/material.dart';
import 'package:note_app/models/notes.dart';

class NotesProvider extends ChangeNotifier {
  List<Notes> notes = [];

  void addNotes ({required String title}){
    notes.add(Notes(note: title, state: false));
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