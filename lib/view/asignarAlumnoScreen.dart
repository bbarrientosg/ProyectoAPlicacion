import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:actividad5/conection/firebase.dart';
import 'package:flutter/material.dart';

class AsignarAlumnoScreen extends StatefulWidget {
  @override
  _AsignarAlumnoScreen createState() => _AsignarAlumnoScreen();
}

class _AsignarAlumnoScreen extends State<AsignarAlumnoScreen> {
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
            "Alumnos",
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
            child: alumnosAsignados(),
          ),
        ],
      );

  alumnosAsignados() => FutureBuilder(
        future: ConectionFirebase().getCurso(),
        builder: (_, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                if (snapshot.data[index]['curso'].toString() == "") {
                  return alumnon(index, snapshot.data[index]['name']);
                } else {
                  return alumnoa(snapshot.data[index]['name']);
                  //index = index ;
                }
                //return null;
              },
              // padding: ,
            );
          }
          return CircularProgressIndicator();
        },
      );
  alumnon(indexalumno, nombre) => FlatButton(
      color: Color(0xFFa8216b),
      child: Text(nombre),
      onPressed: () {
        print("ALUMNO N  ==========>" + nombre);
        popUpAsigarAlumno(indexalumno, nombre);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
          side: BorderSide(color: Color(0xFFf26a44))));
  alumnoa(nombre) => FlatButton(
      color: Color(0xFFf7db69),
      child: Text(nombre),
      onPressed: () {
        //popUpAsigarAlumno(nombre);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
          side: BorderSide(color: Color(0xFFf26a44))));

  cursosAsignables(indexalumno) {
    return Container(
      height: 400.0, // Change as per your requirement
      width: 200.0,
      color: Color(0xFF2e9598),
      child: FutureBuilder(
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
                    ConectionFirebase()
                        .updateCurso(indexalumno, snapshot.data[index]['name']);

                    Navigator.pushNamed(context, '/');
                  },
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  popUpAsigarAlumno(indexalumno, nombre) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF2e9598),
          title: Text("Asignar curso a " + nombre),
          content: cursosAsignables(indexalumno),
        );
      },
    );
  }
}
