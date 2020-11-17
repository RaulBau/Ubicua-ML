import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';

class CompraExitosa extends StatelessWidget {
  static String routeName = 'compra-exitosa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: colores['grisOscuro']),
        iconTheme: IconThemeData(color: colores['grisOscuro']),
        backgroundColor: Color(0xfffff280),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13, bottom: 25),
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xfffff280)),
            child: Column(
              children: [
                Text(
                  'Detalle de la compra',
                  style: TextStyle(
                      color: colores['grisOscuro'],
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '#234234234 - 23 de mayo',
                    style: TextStyle(
                        color: colores['grisOscuro'],
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Producto',
                        style: TextStyle(
                            color: colores['grisOscuro'], fontSize: 15),
                      ),
                      Text(
                        '\$ 6,745',
                        style: TextStyle(
                            color: colores['grisOscuro'], fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Envío gratis',
                        style: TextStyle(color: colores['verde'], fontSize: 15),
                      ),
                      Text(
                        '\$ 0',
                        style: TextStyle(color: colores['verde'], fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 20,
                  indent: 13,
                  endIndent: 13,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
