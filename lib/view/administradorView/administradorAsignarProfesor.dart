import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:actividad5/conection/firebase.dart';
import 'package:flutter/material.dart';

class AdministradorAsignarProfesor extends StatefulWidget {
  @override
  _AdministradorAsignarProfesor createState() =>
      _AdministradorAsignarProfesor();
}

class _AdministradorAsignarProfesor
    extends State<AdministradorAsignarProfesor> {
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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: mostrarAlumno(),
      ),
    );
  }

  mostrarAlumno() => Column(
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
            child: listadoCursos(),
          ),
        ],
      );

  listadoCursos() => FutureBuilder(
        future: ConectionFirebase().getCurso(),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                return FlatButton(
                  child: Text(
                    snapshot.data[index]['name'],
                    style: TextStyle(color: Color(0xFFf7db69)),
                  ),
                  color: Color(0xFFa8216b),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      side: BorderSide(color: Color(0xFFf26a44))),
                  onPressed: () {
                    popUpAsigarAlumno(snapshot.data[index]['code'],
                        snapshot.data[index]['name']);
                  },
                );
              },
              // padding: ,
            );
          }
          return CircularProgressIndicator();
        },
      );

  // alumnon(indexalumno, nombre) => FlatButton(
  //     color: Color(0xFFa8216b),
  //     child: Text(nombre),
  //     onPressed: () {
  //       print("ALUMNO N  ==========>" + nombre);
  //       popUpAsigarAlumno(nombre);
  //     },
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(17.0),
  //         side: BorderSide(color: Color(0xFFf26a44))));
  // alumnoa(nombre) => FlatButton(
  //     color: Color(0xFFf7db69),
  //     child: Text(nombre),
  //     onPressed: () {
  //       //popUpAsigarAlumno(nombre);
  //     },
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(17.0),
  //         side: BorderSide(color: Color(0xFFf26a44))));

  profesoreAsignables(book) {
    return Container(
      height: 400.0, // Change as per your requirement
      width: 200.0,
      color: Color(0xFF2e9598),
      child: FutureBuilder(
        future: ConectionFirebase().getUsers(),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                if (snapshot.data[index]['role'].toString() == "profesor") {
                  print(snapshot.data[index].toString());
                  return FlatButton(
                    child: Text(
                      snapshot.data[index]['name'],
                      style: TextStyle(color: Color(0xFFf7db69)),
                    ),
                    color: Color(0xFFa8216b),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Color(0xFFf26a44))),
                    onPressed: () {
                      fuck(snapshot.data[index]['name'],
                          snapshot.data[index]['email'], book);
                      Navigator.of(context).pop();
                      // Navigator.pushNamed(context, '/');
                    },
                  );
                }
                return SizedBox(height: null, width: null);
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  fuck(nombre, correo, book) {
    data = {"name": nombre, "email": correo};
    ConectionFirebase().updatedataCurso(data, nombre, 'profesor', book);
  }

  popUpAsigarAlumno(book, nombre) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF2e9598),
          title: Text("Asignar curso a " + nombre),
          content: profesoreAsignables(book),
        );
      },
    );
  }
}
