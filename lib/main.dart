import 'package:actividad5/view/administradorView/administradorAsignarProfesor.dart';
import 'package:actividad5/view/administradorView/administradorCreateCurso.dart';
import 'package:actividad5/view/administradorView/administradorCreateUser.dart';
import 'package:actividad5/view/administradorView/administradorVerCursos.dart';
import 'package:actividad5/view/administradorView/administradorVerUsuarios.dart';
import 'package:actividad5/view/administradorView/homeScreenAdministrador.dart';
import 'package:actividad5/view/alumnoView/alumnoInscripcionCurso.dart';
import 'package:actividad5/view/alumnoView/homeScreenAlumno.dart';
import 'package:actividad5/view/asignarAlumnoScreen.dart';
import 'package:actividad5/view/homeScreen.dart';
import 'package:actividad5/view/profesorView/profesorCurso.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:actividad5/view/cursoScreen.dart';
import 'package:actividad5/view/profesorView/homeScreenProfesor.dart';
import 'package:actividad5/view/logInScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/logIn',
      routes: {
        '/logIn': (context) => LogInScreen(),
        '/homeScreen': (context) => HomeScreen(),
        '/homeScreenAlumno': (context) => HomeScreenAlumno(),
        '/homeScreenAdministrador': (context) => HomeScreenAdministrador(),
        '/homeScreenProfesor': (context) => HomeScreenProfesor(),
        '/adminCreateUser': (context) => AdministradorCreateUser(),
        '/administradorCreateCurso': (context) => AdministradorCreateCurso(),
        '/administradorAsignarProfesor': (context) =>
            AdministradorAsignarProfesor(),
        '/administradorVerCursos': (context) => AdministradorVerCursos(),
        '/administradorVerUsuarios': (context) => AdministradorVerUsuarios(),
        '/profesorCurso': (context) => ProfesorCurso(),
        '/alumnoInscripcionCurso': (context) => AlumnoInscripcionCurso(),
        '/cursoScreen': (context) => CursoScreen(),
        '/asignarAlumnoScreen': (context) => AsignarAlumnoScreen(),
      },
    );
  }
}
