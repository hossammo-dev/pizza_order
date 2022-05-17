import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential> createNewUser(
          {String? email, String? password}) async =>
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);

  static Future<UserCredential> signUserIn(
          {String? email, String? password}) async =>
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllData(
          String collection) async =>
      await _firestoreDb.collection(collection).get();

  static Future<DocumentSnapshot<Map<String, dynamic>>> getData(
          {required String? collection, required String? id}) async =>
      await _firestoreDb.collection(collection!).doc(id).get();
}
