import 'package:flutter/material.dart';
import 'package:note_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, top: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: width * 0.97,
              height: height * 0.76,
              child: Consumer<NotesProvider>(builder: (context, model, child) {
                if (model.notes.isEmpty){
                  return const Center(
                    child: Text("There are not any notes yet"),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      String note = model.notes[index].note;
                      bool state = model.notes[index].state;
                      TextStyle style = const TextStyle(fontSize: 21 , fontWeight: FontWeight.bold);
                      return ListTile(
                        onLongPress: (){
                          model.deleteNotes(index: index);
                        },
                        title: Text(
                          note,
                          style: state ? style.copyWith(
                            decoration: TextDecoration.lineThrough
                          ) : style
                        ),
                        trailing: Checkbox(
                            value: state,
                            activeColor: Colors.blue,
                            onChanged: (_) {
                              model.completeTheNote(index: index);
                            }),
                      );
                    },
                    itemCount: model.notes.length,
                  );
                }
              })),
        ],
      ),
    );
  }
}
