import 'package:actividad5/conection/firebase.dart';
import 'package:flutter/material.dart';

class AdministradorCreateCurso extends StatefulWidget {
  @override
  _AdministradorCreateCurso createState() => _AdministradorCreateCurso();
}

class _AdministradorCreateCurso extends State<AdministradorCreateCurso> {
  Map<String, dynamic> data;
  TextEditingController nombreController = TextEditingController();
  TextEditingController codigoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e9598),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: crearCurso(),
      ),
    );
  }

  crearCurso() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Crear Curso",
            style: TextStyle(
              fontSize: 43,
              color: Color(0xFFf7db69),
              decorationColor: Color(0xFFa8216b),
            ),
            softWrap: true,
          ),
          SizedBox(height: 30),
          _textFormField(nombreController, "Nombre"),
          SizedBox(height: 10),
          _textFormField(codigoController, "Codigo"),
          SizedBox(height: 20),
          FlatButton(
              onPressed: () {
                cursoAdd();
                Navigator.pushNamed(context, '/homeScreenAdministrador');
              },
              child: Text(
                "Crear Curso",
                style: TextStyle(color: Color(0xFFf7db69)),
              ),
              color: Color(0xFFa8216b),
              minWidth: 250,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                  side: BorderSide(color: Color(0xFFf26a44)))),
          SizedBox(height: 100),
        ]),
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

  cursoAdd() {
    data = {"name": nombreController.text, "code": codigoController.text};
    ConectionFirebase().addData(data, codigoController.text, 'curso');
  }
}
