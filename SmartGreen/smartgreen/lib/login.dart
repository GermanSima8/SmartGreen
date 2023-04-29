import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartgreen/registro.dart';
import 'main.dart';
import 'seccion2.dart';
import 'seccion3.dart';
import 'seccion4.dart';
import 'seccion5.dart';
import 'home.dart';
import 'registro.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/logo3.png",
                  width: 450,
                  height: 450,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 20.0,
              ),
              __registrationbutton()
            ],
          ),
        ),
      ),
    );
  }

  //Zona de correo
  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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

  //Zona de contraseña
  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

//Botón de inicio
  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Text('Iniciar'),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
        },
      );
    });
  }

  //Botón de registro
  Widget __registrationbutton() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Text('Registrarse'),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BasicForm()));
        },
      );
    });
  }
}

//Clase para la siguiente pantalla
class SecondScreen extends StatefulWidget {
  SecondState createState() => SecondState();
}

class SecondState extends State<SecondScreen> {
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return MyHomePage();
      case 1:
        return seccion2();
      case 2:
        return seccion3();
      case 3:
        return seccion4();
      case 4:
        return seccion5();
    }
  }

  _OnSelectItem(pos) {
    setState(() {
      _selectDrawerItem = pos;
    });
  }

//Segunda pantalla con el Drawer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 161, 62),
        title: const Text("Invernadero"),
        centerTitle: true,
        actions: <Widget>[],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Invernadero Inteligente"),
              accountEmail: Text("UTP"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo2.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pasto.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wind_power),
              title: Text("Ventilación"),
              onTap: () {
                _OnSelectItem(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text("Clima"),
              onTap: () {
                _OnSelectItem(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.landscape),
              title: Text("Humedad"),
              onTap: () {
                _OnSelectItem(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.thermostat),
              title: Text("Temperatura"),
              onTap: () {
                _OnSelectItem(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.water),
              title: Text("Regado"),
              onTap: () {
                _OnSelectItem(4);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}
