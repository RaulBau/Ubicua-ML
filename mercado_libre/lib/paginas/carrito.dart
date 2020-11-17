import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/drawer.dart';
import 'package:mercado_libre/widgets/search_delegate.dart';

class Carrito extends StatelessWidget {
  static String routeName = 'carrito';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarML(
          bottom: TabBar(
            indicatorColor: colores['grisOscuro'],
            tabs: [
              Tab(
                  icon: Text(
                'Carrito (0)',
                style: TextStyle(
                    color: colores['grisOscuro'],
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )),
              Tab(
                  icon: Text(
                'Guardados (0)',
                style: TextStyle(
                    color: colores['grisOscuro'],
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {
                showSearch(context: context, delegate: ProductSearch());
              },
            ),
          ],
        ),
        drawer: DrawerML(),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Text(
                    'Tu carrito está vacío',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colores['grisOscuro'],
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '¿No sabes qué comprar? \n¡Miles de productos te esperan!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colores['grisOscuro'],
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Text(
                    'No tienes productos guardados',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colores['grisOscuro'],
                        fontSize: 22,
                        fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Si aún no estás decidido en comprar algún producto de tu carrito, puedes dejarlo aquí.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colores['grisOscuro'],
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
