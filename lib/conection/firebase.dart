import 'package:actividad5/model/alumno.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:actividad5/model/curso.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ConectionFirebase {
  Map data;

  Future<User> signIn() async {
    GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = FirebaseAuth.instance.currentUser;
      assert(user.uid == currentUser.uid);

      print('LogIn correcto: $user');

      return user;
    }
    return null;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    print("session terminada");
  }

  addData(demoData, String code, String collectionDT) {
    CollectionReference cursoCollectionReference =
        FirebaseFirestore.instance.collection(collectionDT);
    // cursoCollectionReference.add(demoData).whenComplete(
    //     () => print("Datos anadidos a Firestore: " + demoData.toString()));
    cursoCollectionReference.doc(code).set(demoData).whenComplete(
        () => print("Datos anadidos a Firestore: " + demoData.toString()));
  }

  // addProfesorAlumno(demoData, s, String collectionDT) {
  //   CollectionReference cursoCollectionReference =
  //       FirebaseFirestore.instance.collection(collectionDT);
  //   cursoCollectionReference.add(demoData).whenComplete(
  //       () => print("Datos anadidos a Firestore: " + demoData.toString()));

  //   FirebaseFirestore.instance
  //       .collection("curso")
  //       .doc(s)
  //       .collection('s')
  //       .update(demoData);
  // }

  Future<List<DocumentSnapshot>> getCurso() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('curso')
        .where('name', isEqualTo: Curso().nombre)
        .get();

    return querySnapshot.docs;
  }

  // Obtiene el la collection de una collection especifica
  Future<List<DocumentSnapshot>> getSubCollectionofCurso(
      code, subCollection) async {
    String email = FirebaseAuth.instance.currentUser.email;
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('curso')
        .doc(code)
        .collection(subCollection)
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> getAlumnos() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: Curso().nombre)
        .get();

    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> getCursoAlumnos(code) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('curso')
        .doc(code)
        .collection('alumno')
        .get();

    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> getUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    return querySnapshot.docs;
  }

  // Future<List<DocumentSnapshot>> getUsers2(co) async {
  //   final s = FirebaseFirestore.instance.collection('users').doc(co).get();
  //   User user = s;
  //   return s.;
  // }

  updateCurso(index, curso) async {
    CollectionReference cursoCollectionReference =
        FirebaseFirestore.instance.collection('alumno');
    QuerySnapshot querySnapshot = await cursoCollectionReference.get();
    querySnapshot.docs[index].reference.update({'curso': curso.toString()});
  }

  updatedataCurso(data, nombre, collection, book) async {
    CollectionReference cursoCollectionReference = FirebaseFirestore.instance
        .collection('curso')
        .doc(book)
        .collection(collection);

    cursoCollectionReference.doc(nombre).set(data).whenComplete(
        () => print("Datos anadidos a Firestore: " + data.toString()));
  }
}

class UserFirebase {
  // static signInWithGoogle() async {
  //   GoogleSignIn googleSignIn = GoogleSignIn();
  //   final acc = await googleSignIn.signIn();
  //   final auth = await acc.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: auth.accessToken, idToken: auth.idToken);
  //   final res = await FirebaseAuth.instance.signInWithCredential(credential);
  //   return res.user;
  // }

  signUpWithEmail(String email, String password, String name, rol) async {
    final create = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = create.user;
    Map<String, dynamic> userData = {
      "name": name,
      "email": user.email,
      "role": rol,
    };
    FirebaseFirestore.instance.collection("users").doc(user.uid).set(userData);
    //return user;
  }

  static signInWithEmail(String email, String password) async {
    final aux = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    User user = aux.user;
    return user;
  }

  singOut() async {
    FirebaseAuth.instance.signOut();
  }
}
