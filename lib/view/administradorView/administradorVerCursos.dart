import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:actividad5/conection/firebase.dart';
import 'package:flutter/material.dart';

class AdministradorVerCursos extends StatefulWidget {
  @override
  _AdministradorVerCursos createState() => _AdministradorVerCursos();
}

class _AdministradorVerCursos extends State<AdministradorVerCursos> {
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
                  onPressed: () {},
                );
              },
              // padding: ,
            );
          }
          return CircularProgressIndicator();
        },
      );
}
