import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:actividad5/conection/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AlumnoInscripcionCurso extends StatefulWidget {
  @override
  _AlumnoInscripcionCurso createState() => _AlumnoInscripcionCurso();
}

class _AlumnoInscripcionCurso extends State<AlumnoInscripcionCurso> {
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e9598),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: mostrarCurso(),
      ),
    );
  }

  mostrarCurso() => Column(
        children: [
          Text(
            "Cursos of " + FirebaseAuth.instance.currentUser.email,
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFFf7db69),
              decorationColor: Color(0xFFa8216b),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200.0,
              // child: SingleChildScrollView(
              child: listadoCursos(),
              // ),
            ),
          ),
        ],
      );

  listadoCursos() => FutureBuilder(
        future: ConectionFirebase().getCurso(),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          //print("User mail: " + UserFirebase.nombreUsuario());
          //<List<DocumentSnapshot>> sasdas = ConectionFirebase().Test3(code);
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return FlatButton(
                    child: Text(snapshot.data[index]['name']),
                    onPressed: () {
                      print("CURSO PRESIONADO " + snapshot.data[index]['name']);
                      popCurso(snapshot.data[index]['code'],
                          snapshot.data[index]['name']);
                      // listadoCursosProfesor();
                    },
                  );
                  // return listadoCursosProfesor(snapshot.data[index]['code']);
                });
          }
          return CircularProgressIndicator();
        },
      );

  popCurso(cursoactualcodigo, cursoactualnombre) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('curso').get();
    String email = FirebaseAuth.instance.currentUser.email;
    int contador = 0;
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      //print("s");
      QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
          .collection('curso')
          .doc(querySnapshot.docs[i]['code'])
          .collection('alumno')
          .where('email', isEqualTo: email)
          .get();
      if (querySnapshot2.docs.length != 0) {
        for (var j = 0; j < querySnapshot2.docs.length; j++) {
          contador++;
        }
      }
      // else {
      // print("querySnapshot2.docs.length " +
      // querySnapshot2.docs.length.toString());
      // }
    }
    //contador = 0;
    if (contador == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF2e9598),
            title: Text(
              "¿Quieres inscribirte en el curso " + cursoactualnombre + "?",
              textAlign: TextAlign.center,
            ),
            content: asignarCurso(email, cursoactualcodigo),
            // actions: [
            //   FlatButton(
            //     child: Text("Asignar"),
            //     color: Colors.black,
            //   )
            // ],
          );
        },
      );
    } else if (contador == 1) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF2e9598),
            title: Text("Ya tienes un Curso Asignado"),
          );
        },
      );
    }
    print(contador);
  }

  asignarCurso(email, cursoactual) {
    return FlatButton(
      child: Text("Asignar"),
      onPressed: () async {
        asignarFirebase(email, cursoactual);
        Navigator.of(context).pop();
      },
    );
  }

  asignarFirebase(correo, cursoactual) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: correo)
        .get();

    data = {
      "name": querySnapshot.docs[0]['name'],
      "email": querySnapshot.docs[0]['email']
    };
    ConectionFirebase().updatedataCurso(
        data, querySnapshot.docs[0]['name'], 'alumno', cursoactual);
  }
}
