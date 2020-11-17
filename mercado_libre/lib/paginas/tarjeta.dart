import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';

class Tarjeta extends StatelessWidget {
  static String routeName = 'tarjetas';
  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: 0, viewportFraction: .9);

    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: colores['grisOscuro']),
        iconTheme: IconThemeData(color: colores['grisOscuro']),
        backgroundColor: colores['amarillo'],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color.fromARGB(
                    Random().nextInt(255),
                    Random().nextInt(255),
                    Random().nextInt(255),
                    Random().nextInt(255))),
          ),
          Expanded(
            child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          helperText: 'Número de tarjeta',
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
                  ),
              
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          helperText: 'Titular de la tarjeta',
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
                  ),
              
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          helperText: 'Vencimiento',
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
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          helperText: 'Código de seguridad',
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
                  ),
              
                ]),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: Text('Anterior')),
          FlatButton(
              onPressed: () {
                pageController.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: Text('Siguiente')),
        ],
      ),
    );
  }
}
