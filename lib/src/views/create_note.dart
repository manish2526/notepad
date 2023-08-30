import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notepad/src/services/local_db.dart';

import '../model/note.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  @override
  Widget build(BuildContext context) {

    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();

    final localDB = LocalDBServices();


    @override
    void dispose(){
      super.dispose();

      log(_titleController.text);
      log(_descriptionController.text);

      final title = _titleController.text;
      final desc = _descriptionController.text;

      final newNote = Note(
        id: Isar.autoIncrement,
        title: title,
        description: desc,
        lastMod: DateTime.now(),
      );

      localDB.saveNote(note: newNote);



      _titleController.dispose();
      _descriptionController.dispose();


    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
                  Navigator.pop(context);
                },
                ),
              ),
            ],
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(border: InputBorder.none,
                hintText: "title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, ),
              child: TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(border: InputBorder.none,
                    hintText: "Desc"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
