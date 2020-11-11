import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/login.dart';

class Register extends StatefulWidget {
  static String routeName = 'register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var check = false;
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
              'Completa tus datos',
              style: TextStyle(
                  color: colores['grisOscuro'],
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 5),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Nombre',
                helperText: 'Ingrésalo tal como figura en tu documento',
                helperStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Apellido',
                helperText: 'Ingrésalo tal como figura en tu documento',
                helperStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'E-mail',
                helperText: 'Asegúrate de tener acceso a este e-mail',
                helperStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Clave',
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Tu clave debe tener entre 6 y 20 caracteres, y al menos uno de ellos debe ser especial (por ejemplo: ?.-\$). No incluyas tu nombre, apellido o e-mail, ni caracteres idénticos consecutivos.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                  value: check,
                  onChanged: (val) {
                    setState(() {
                      check = val;
                    });
                  }),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Acepto los ',
                    children: [
                      TextSpan(
                        text: 'Términos y condiciones ',
                        style: TextStyle(color: Colors.blue),
                        children: [
                          TextSpan(
                            text:
                                'y autorizo el uso de mis datos de acuerdo a la ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Declaración de privacidad ',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                    settings: RouteSettings(name: Login.routeName)));
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
        ],
      ),
    );
  }
}
