import 'package:actividad5/conection/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AdministradorCreateUser extends StatefulWidget {
  @override
  _AdministradorCreateUser createState() => _AdministradorCreateUser();
}

enum Roles { alumno, profesor }

class _AdministradorCreateUser extends State<AdministradorCreateUser> {
  Map<String, dynamic> data;
  TextEditingController nombreController;
  TextEditingController emailController;
  TextEditingController passwordController;
  Roles rol;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    rol = Roles.alumno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e9598),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: crearAlumno(),
      ),
    );
  }

  crearAlumno() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Crear Usuario",
              style: TextStyle(
                fontSize: 43,
                color: Color(0xFFf7db69),
                decorationColor: Color(0xFFa8216b),
              ),
              softWrap: true,
            ),
            SizedBox(height: 10),
            _textFormField(nombreController, "Nombre"),
            SizedBox(height: 10),
            _textFormField(emailController, "Email"),
            SizedBox(height: 10),
            _textFormField(passwordController, "Contraseña"),
            SizedBox(height: 10),
            Text("Rol:"),
            SizedBox(height: 10),
            RadioListTile(
              title: const Text("Alumno"),
              value: Roles.alumno,
              groupValue: rol,
              onChanged: (value) {
                setState(() {
                  rol = value;
                });
              },
            ),
            RadioListTile(
              title: const Text("Profesor"),
              value: Roles.profesor,
              groupValue: rol,
              onChanged: (value) {
                setState(() {
                  rol = value;
                });
              },
            ),
            SizedBox(height: 10),
            FlatButton(
                onPressed: () {
                  createUser();
                  //Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/homeScreenAdministrador');
                },
                child: Text(
                  "Crear User",
                  style: TextStyle(color: Color(0xFFf7db69)),
                ),
                color: Color(0xFFa8216b),
                minWidth: 250,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Color(0xFFf26a44)))),
            //SizedBox(height: 100),
          ]),
        ),
      );

  _textFormField(TextEditingController controller, String labeltext) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,

        labelText: labeltext,
        fillColor: Color(0xFFa8216b),
        border: const OutlineInputBorder(),
        //focusColor: Color(0xFFf7db69),
        labelStyle: TextStyle(color: Color(0xFFf7db69)),
        hintStyle: TextStyle(color: Color(0xFFf7db69)),
        // errorStyle: TextStyle(color: Color(0xFFf7db69)),
      ),
      style: TextStyle(color: Color(0xFFf7db69)),
      //cursorColor: Color(0xFF2e9598),
    );
  }

  createUser() async {
    final create = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    User user = create.user;
    Map<String, dynamic> userData = {
      "name": nombreController.text,
      "email": user.email,
      "role": rol.toString().split('.').last,
    };
    FirebaseFirestore.instance.collection("users").doc(user.uid).set(userData);
  }
}
