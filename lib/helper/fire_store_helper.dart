import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStoreHelper {
  CloudFireStoreHelper._();
  static final CloudFireStoreHelper cloudFireStoreHelper =
  CloudFireStoreHelper._();

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference notesRef;

  void connectionWithNoteKeeperCollection() {
    notesRef = firebaseFirestore.collection('notekeeper');
  }

  //TODO:insertRecord
  Future<void> insertRecord({
    required String id,
    required String title,
    required String note,
    required String time,
  }) async {
    connectionWithNoteKeeperCollection();

    Map<String, dynamic> data = {
      'title': title,
      'note': note,
      'time': time,
    };

    await notesRef.doc(id).set(data);
  }

  Stream<QuerySnapshot> selectRecord() {
    connectionWithNoteKeeperCollection();

    return notesRef.snapshots();
  }

  Future<void> updateRecord(
      {required String id,
        required String title,
        required String note,
        required String time}) async {
    connectionWithNoteKeeperCollection();

    Map<String, dynamic> updatedData = {
      'title': title,
      'note': note,
      'time': time,
    };

    await notesRef.doc(id).update(updatedData);
  }

  Future<void> deleteRecord({required String id}) async {
    connectionWithNoteKeeperCollection();

    await notesRef.doc(id).delete();
  }
}