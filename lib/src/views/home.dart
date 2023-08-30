import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notepad/src/model/note.dart';
import 'package:notepad/src/res/assets.dart';
import 'package:notepad/src/services/local_db.dart';
import 'package:notepad/src/views/create_note.dart';
import 'package:notepad/src/views/widgets/empty_view.dart';
import 'package:notepad/src/views/widgets/note_list_item.dart';

import '../res/strings.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppString.appname,
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      isListView = !isListView;
                    });
                  }, icon: Icon(isListView ? Icons.splitscreen_outlined : Icons.grid_view))
                  // IconButton(onPressed: onPressed, icon: icon)
                ],
              ),
            ),
            // Lottie.asset(AnimationAssets.empty),

            // const EmptyView(),
            Expanded(
              child: StreamBuilder(
                  stream: LocalDBServices().listenAllNotes(),
                builder: (context, snapshot) {
                    if(snapshot.data != null  ){
                      return const EmptyView();
                    }
                  final notes = snapshot.data!;


                  return Expanded(
                    child: ListView.builder(
                        itemCount: notes.length,
                        itemBuilder:(context, index){
                      return NoteListItem();
                    }),
                  );
                }
              ),
            )

          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNoteView()));
        },
        backgroundColor: Colors.black,
      child: Icon(Icons.add, color: Colors.grey,),),
    );
  }
}
