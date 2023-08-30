import 'package:isar/isar.dart';
import 'package:notepad/src/model/note.dart';

class LocalDBServices {

  late Future<Isar> db;

  LocalDBServices(){
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([NoteSchema], inspector: true,);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> saveNote({required note}) async{
    final isar = await db;
    isar.writeTxnSync(() => isar.notes.putSync(note));
  }

  Stream<List> listenAllNotes() async* {
    final isar = await db;
    yield* isar.notes.where().watch(fireImmediately: true);

  }


}