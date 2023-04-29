import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MqttServerClient client;
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  bool _switchValue4 = false;
  bool _switchValue5 = false;
  @override
  void initState() {
    super.initState();

    // Inicializar cliente MQTT
    client =
        MqttServerClient.withPort('broker.emqx.io', 'flutter_client', 1883);
    client.keepAlivePeriod = 20;
    client.autoReconnect = true;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;

    mqttConnect();
  }

  // Conexion del MQTT
  mqttConnect() async {
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      log(e.toString());
    }
  }

  void mqttSend(String message, String topic) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
    } else {
      log("No se puede enviar el mensaje. El cliente MQTT no está conectado.");
    }
  }

  void onConnected() {
    log("Conectado");
  }

  void onDisconnected() {
    log("Desconectado");
  }

//Switch
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.wind_power_outlined),
                    Text('Ventilador de la sección 1'),
                    Switch(
                      activeColor: Colors
                          .green, // cambia el color del interruptor activo
                      inactiveThumbColor:
                          Colors.red, // cambia el color del pulgar inactivo
                      inactiveTrackColor: Colors.red.withOpacity(
                          0.5), // cambia el color del track inactivo
                      value: _switchValue1,
                      onChanged: (bool newValue) {
                        setState(() {
                          _switchValue1 = newValue;
                        });
                        mqttSend(newValue ? "1" : "0",
                            "UTPwnpErlYIgiCiv07Vfox2OodFP2nV4m");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.wind_power_outlined),
                    Text('Ventilador de la sección 2'),
                    Switch(
                      activeColor: Colors
                          .green, // cambia el color del interruptor activo
                      inactiveThumbColor:
                          Colors.red, // cambia el color del pulgar inactivo
                      inactiveTrackColor: Colors.red.withOpacity(
                          0.5), // cambia el color del track inactivo
                      value: _switchValue2,
                      onChanged: (bool newValue) {
                        setState(() {
                          _switchValue2 = newValue;
                        });
                        mqttSend(newValue ? "1" : "0",
                            "UTPwnpErlYIgiCiv07Vfox2OodFP2nV4m");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.wind_power_outlined),
                    Text('Ventilador de la sección 3'),
                    Switch(
                      activeColor: Colors
                          .green, // cambia el color del interruptor activo
                      inactiveThumbColor:
                          Colors.red, // cambia el color del pulgar inactivo
                      inactiveTrackColor: Colors.red.withOpacity(
                          0.5), // cambia el color del track inactivo
                      value: _switchValue3,
                      onChanged: (bool newValue) {
                        setState(() {
                          _switchValue3 = newValue;
                        });
                        mqttSend(newValue ? "1" : "0",
                            "UTPwnpErlYIgiCiv07Vfox2OodFP2nV4m");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.wind_power_outlined),
                    Text('Ventilador de la sección 4'),
                    Switch(
                      activeColor: Colors
                          .green, // cambia el color del interruptor activo
                      inactiveThumbColor:
                          Colors.red, // cambia el color del pulgar inactivo
                      inactiveTrackColor: Colors.red.withOpacity(
                          0.5), // cambia el color del track inactivo
                      value: _switchValue4,
                      onChanged: (bool newValue) {
                        setState(() {
                          _switchValue4 = newValue;
                        });
                        mqttSend(newValue ? "1" : "0",
                            "UTPwnpErlYIgiCiv07Vfox2OodFP2nV4m");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.wind_power_outlined),
                    Text('Ventilador de la sección 5'),
                    Switch(
                      activeColor: Colors
                          .green, // cambia el color del interruptor activo
                      inactiveThumbColor:
                          Colors.red, // cambia el color del pulgar inactivo
                      inactiveTrackColor: Colors.red.withOpacity(
                          0.5), // cambia el color del track inactivo
                      value: _switchValue5,
                      onChanged: (bool newValue) {
                        setState(() {
                          _switchValue5 = newValue;
                        });
                        mqttSend(newValue ? "1" : "0",
                            "UTPwnpErlYIgiCiv07Vfox2OodFP2nV4m");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
