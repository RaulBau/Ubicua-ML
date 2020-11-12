import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/login.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/iconoCategoria.dart';
import 'package:mercado_libre/widgets/tarjetaSlider.dart';

class Principal extends StatefulWidget {
  static String routeName = 'principal';
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PageController pageController;

  Timer timer;

  var paginasSlider = [
    TarjetaSlider(imagen: 'assets/1.jpg'),
    TarjetaSlider(imagen: 'assets/2.jpg'),
    TarjetaSlider(imagen: 'assets/3.jpg'),
    TarjetaSlider(imagen: 'assets/4.jpg'),
    TarjetaSlider(imagen: 'assets/5.jpg'),
  ];

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: .9,
      initialPage: 5,
    );
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      pageController.nextPage(
          duration: Duration(milliseconds: 600), curve: Curves.ease);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarML(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: IconButton(
                  iconSize: 45,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                        settings: RouteSettings(name: Login.routeName)));
                  },
                  icon: CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.network(
                      'https://cdn.discordapp.com/attachments/544378436156915714/755288728443813888/tu2.png',
                    ).image,
                  )),
              accountName: Text(''),
              accountEmail: Text(''),
              decoration: BoxDecoration(color: colores['amarillo']),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                colores['amarillo'],
                Theme.of(context).scaffoldBackgroundColor
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            height: 170,
            width: double.infinity,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return paginasSlider[index % paginasSlider.length];
              },
              controller: pageController,
              physics: BouncingScrollPhysics(),
              pageSnapping: true,
              onPageChanged: (val) {
                // pageController.
              },
            ),
          ),
          IconoCategoria(
            icono: Icons.shop,
            colorFondo: Colors.white,
            diametro: 55,
            nombre: "Compras Compras Compras Compras ",
          ),
        ],
      ),
    );
  }
}
