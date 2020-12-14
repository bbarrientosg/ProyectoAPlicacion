import 'package:actividad5/conection/firebase.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreen createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  TextEditingController emailController;
  TextEditingController passwordController;
  // TextEditingController rolController;

  @override
  void initState() {
    super.initState();
    // nombreController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    // rolController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e9598),
      body: Center(
        child: body(),
      ),
    );
  }

  body() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LogIn",
              style: TextStyle(
                fontSize: 43,
                color: Color(0xFFf7db69),
                decorationColor: Color(0xFFa8216b),
              ),
              softWrap: true,
            ),
            SizedBox(height: 40),
            // _flatButton(),
            // SizedBox(height: 30),
            _textFormField(emailController, "Email"),
            SizedBox(height: 10),
            _textFormField(passwordController, "Contraseña"),
            FlatButton(
                onPressed: () async {
                  logIn();
                },
                child: Text(
                  "Ingresar",
                  style: TextStyle(color: Color(0xFFf7db69)),
                ),
                color: Color(0xFFa8216b),
                minWidth: 250,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Color(0xFFf26a44)))),
          ],
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

  _flatButton() => FlatButton(
      onPressed: () {
        ConectionFirebase().signIn().then((value) {
          if (value != null) {
            Navigator.pushNamed(context, '/homeScreen');
          }
        });
      },
      child: Text("Ingresar con cuenta de Google",
          style: TextStyle(color: Color(0xFFf7db69))),
      color: Color(0xFFa8216b),
      minWidth: 250,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
          side: BorderSide(color: Color(0xFFf26a44))));

  logIn() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      print("Email and password cannot be empty");
      return;
    }
    try {
      final user = UserFirebase.signInWithEmail(
          emailController.text, passwordController.text);
      if (user != null) {
        print('login successful. User $user');
        Navigator.pushNamed(context, '/homeScreen');
      }
    } catch (e) {
      print(e);
    }
  }
}
