import 'package:actividad5/conection/firebase.dart';
import 'package:flutter/material.dart';

class HomeScreenAdministrador extends StatefulWidget {
  @override
  _HomeScreenAdministrador createState() => _HomeScreenAdministrador();
}

// Color palette
// Color(0xFF2e9598);
// Color(0xFFf7db69);
// Color(0xFFf26a44);
// Color(0xFFec1b4b);
// Color(0xFFa8216b);

class _HomeScreenAdministrador extends State<HomeScreenAdministrador> {
  Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: menuAdmin(),
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
}
