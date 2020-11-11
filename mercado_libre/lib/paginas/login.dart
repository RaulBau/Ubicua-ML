import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/principal.dart';
import 'package:mercado_libre/paginas/registro.dart';

class Login extends StatelessWidget {
  static String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: colores['grisOscuro']),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              '¡Hola! Para seguir, ingresá tu e-mail o usuario',
              style: TextStyle(
                  color: colores['grisOscuro'],
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 50),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                  hintText: 'E-mail o usuario',
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w300)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return Principal();
                }), (route) => false);
              },
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Text(
                'Continuar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color(0xff3483fa),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return LoginConfirm();
                  },
                  settings: RouteSettings(name: LoginConfirm.routeName)));
            },
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text(
              'Crear cuenta',
              style: TextStyle(
                  color: Color(0xff3483fa),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class LoginConfirm extends StatelessWidget {
  static String routeName = 'login-confirm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: colores['grisOscuro']),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Si aún no tienes cuenta, \nregístrate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colores['grisOscuro'],
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Register();
                          },
                          settings: RouteSettings(name: Register.routeName)));
                    },
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Text(
                      'Registrarme',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color(0xff3483fa),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                        settings: RouteSettings(name: Login.routeName)));
                  },
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    'Ya tengo cuenta',
                    style: TextStyle(
                        color: Color(0xff3483fa),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text.rich(
              TextSpan(
                text:
                    'Al registrarme, declaro que soy mayor de edad y acepto los ',
                children: [
                  TextSpan(
                    text: 'Términos y condiciones ',
                    style: TextStyle(color: Colors.blue),
                    children: [
                      TextSpan(
                        text: 'y las ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Políticas de privacidad ',
                            style: TextStyle(color: Colors.blue),
                            children: [
                              TextSpan(
                                text: 'de Mercado Libre y MercadoPago',
                                style: TextStyle(color: Colors.grey),
                                children: [],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
