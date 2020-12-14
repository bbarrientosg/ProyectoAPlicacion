import 'package:actividad5/conection/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

// Color palette
// Color(0xFF2e9598);
// Color(0xFFf7db69);
// Color(0xFFf26a44);
// Color(0xFFec1b4b);
// Color(0xFFa8216b);

class _HomeScreen extends State<HomeScreen> {
  Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: rol(),
      ),
    );
  }

  menuAdmin() => Container(
        color: Color(0xFF2e9598),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ADMIN MENU"),
                SizedBox(height: 10),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/adminCreateUser');
                    },
                    child: Text("Crear nuevo usuario",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),

                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/administradorCreateCurso');
                    },
                    child: Text(
                      "Crear curso",
                      style: TextStyle(color: Color(0xFFf7db69)),
                    ),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),

                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/administradorAsignarProfesor');
                    },
                    child: Text("Asignar Profesor",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/administradorVerCursos');
                    },
                    child: Text("Ver Cursos",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/administradorVerUsuarios');
                    },
                    child: Text("Ver Usuarios",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),
                FlatButton(
                    onPressed: () {
                      UserFirebase().singOut();
                      Navigator.pushNamed(context, '/logIn');
                    },
                    child: Text("Cerrar Session",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                // Text(
                // data.toString(),
                // textAlign: TextAlign.center,
                // ),
              ],
            )
          ],
        ),
      );

  menuAlumno() => Container(
        color: Color(0xFF2e9598),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alumno MENU"),
                SizedBox(height: 10),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/alumnoInscripcionCurso');
                    },
                    child: Text(
                      "Cursos",
                      style: TextStyle(color: Color(0xFFf7db69)),
                    ),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),
                FlatButton(
                    onPressed: () {
                      UserFirebase().singOut();
                      Navigator.pushNamed(context, '/logIn');
                    },
                    child: Text("Cerrar Session",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
              ],
            )
          ],
        ),
      );

  menuProfesor() => Container(
        color: Color(0xFF2e9598),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Profesor MENU"),
                SizedBox(height: 10),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profesorCurso');
                    },
                    child: Text("Curso",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                // SizedBox(
                //   height: 2,
                // ),
                // FlatButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/asignarAlumnoScreen');
                //     },
                //     child: Text("Asignar Alumno",
                //         style: TextStyle(color: Color(0xFFf7db69))),
                //     color: Color(0xFFa8216b),
                //     minWidth: 250,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(17.0),
                //         side: BorderSide(color: Color(0xFFf26a44)))),
                SizedBox(height: 2),
                FlatButton(
                    onPressed: () {
                      UserFirebase().singOut();
                      Navigator.pushNamed(context, '/logIn');
                    },
                    child: Text("Cerrar Session",
                        style: TextStyle(color: Color(0xFFf7db69))),
                    color: Color(0xFFa8216b),
                    minWidth: 250,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44)))),
                // Text(
                // data.toString(),
                // textAlign: TextAlign.center,
                // ),
              ],
            )
          ],
        ),
      );

  rol() => StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  if (user['role'] == 'administrador') {
                    return menuAdmin();
                  } else if (user['role'] == 'alumno') {
                    return menuAlumno();
                  } else if (user['role'] == 'profesor') {
                    return menuProfesor();
                  }
                }
                return CircularProgressIndicator();
              },
            );
          }
          return Material(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        },
      );
}
