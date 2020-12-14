import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:actividad5/conection/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfesorCurso extends StatefulWidget {
  @override
  _ProfesorCurso createState() => _ProfesorCurso();
}

class _ProfesorCurso extends State<ProfesorCurso> {
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

  mostrarCurso() => Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Cursos",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFFf7db69),
              decorationColor: Color(0xFFa8216b),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              // child: SingleChildScrollView(
              child: listadoCursos(),
              // ),
            ),
          ),
        ],
      ));

  listadoCursos() => FutureBuilder(
        future: ConectionFirebase().getCurso(),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return listadoCursosProfesor(snapshot.data[index]['code']);
                });
          }
          return CircularProgressIndicator();
        },
      );

  listadoCursosProfesor(code) => FutureBuilder(
        future: ConectionFirebase().getSubCollectionofCurso(code, 'profesor'),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return FlatButton(
                      child: Text(code),
                      onPressed: () {
                        listaAlumnosXCurso(code);
                      },
                      color: Color(0xFFa8216b),
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                          side: BorderSide(color: Color(0xFFf26a44))));
                  //print(fw);
                });
          }
          return CircularProgressIndicator();
        },
      );
  listaAlumnosXCurso(code) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF2e9598),
          title: Text(
            "Alumnos de " + code,
            textAlign: TextAlign.center,
          ),
          content: listadoCursosProfesorFuture(code),
        );
      },
    );
  }

  listadoCursosProfesorFuture(code) {
    return SingleChildScrollView(
        child: Container(
      width: double.maxFinite,
      child: FutureBuilder(
        future: ConectionFirebase().getCursoAlumnos(code),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData) {
            print("################# " + snapshot.data.length.toString());
            if (snapshot.data.length >= 1) {
              return SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return Text(
                        snapshot.data[index]['name'],
                        textAlign: TextAlign.center,
                      );
                    }),
              );
            } else if (snapshot.data.length == 0) {
              return Text(
                "No hay alumnos instritos actualmente",
                textAlign: TextAlign.center,
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
