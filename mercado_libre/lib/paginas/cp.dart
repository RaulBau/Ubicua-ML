import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';

class CodPost extends StatelessWidget {
  static String routeName = 'codigo-postal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededed),
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: colores['grisOscuro']),
        iconTheme: IconThemeData(color: colores['grisOscuro']),
        backgroundColor: colores['amarillo'],
      ),
      body: ListView(
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elige dónde recibir tus compras',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: colores['grisOscuro'],
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Podrás ver costos y tiempos de entrega precisos en todo lo que busques.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        helperText: 'Ingresar un código postal',
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
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: FlatButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).pop();
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
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding: EdgeInsets.symmetric(vertical: 13),
                    child: Text(
                      'No sé mi código',
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
              )),
        ],
      ),
    );
  }
}
