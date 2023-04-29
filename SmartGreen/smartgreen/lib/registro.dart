import 'package:flutter/material.dart';

class BasicForm extends StatefulWidget {
  @override
  _BasicFormState createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Regístrate',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _nombre(),
              SizedBox(
                height: 15.0,
              ),
              _correo(),
              SizedBox(
                height: 15.0,
              ),
              _contrasena(),
              SizedBox(
                height: 20.0,
              ),
              _registrar(),
            ],
          ),
        ),
      ),
    );
  }
}

//Zona de nombre
Widget _nombre() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle),
          hintText: 'Ejemplo German',
          labelText: 'Nombre de usuario',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

//Zona de correo
Widget _correo() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'Ejemplo @Correo.com',
          labelText: 'Correo electrónico',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

//Zona de nombre
Widget _contrasena() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.password_outlined),
          labelText: 'Contraseña',
        ),
        onChanged: (value) {},
      ),
    );
  });
}

//Botón de registrar
Widget _registrar() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return ElevatedButton(
      child: Text('Registrar'),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () {},
    );
  });
}
