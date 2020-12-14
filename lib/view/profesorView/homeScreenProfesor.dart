import 'package:actividad5/conection/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreenProfesor extends StatefulWidget {
  @override
  _HomeScreenProfesor createState() => _HomeScreenProfesor();
}

// Color palette
// Color(0xFF2e9598);
// Color(0xFFf7db69);
// Color(0xFFf26a44);
// Color(0xFFec1b4b);
// Color(0xFFa8216b);

class _HomeScreenProfesor extends State<HomeScreenProfesor> {
  Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: menuProfesor(),
      ),
    );
  }

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
}
