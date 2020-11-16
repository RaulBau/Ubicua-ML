import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/login.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/categorias.dart';
import 'package:mercado_libre/widgets/drawer.dart';
import 'package:mercado_libre/widgets/iconoCategoria.dart';
import 'package:mercado_libre/widgets/tarjetaArticulo.dart';
import 'package:mercado_libre/widgets/tarjetaSlider.dart';

class Principal extends StatefulWidget {
  static String routeName = 'principal';
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PageController pageController;
  GlobalKey pageKey = GlobalKey();

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
      pageController
          .nextPage(duration: Duration(milliseconds: 600), curve: Curves.ease)
          .catchError(() {});
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
      appBar: AppbarML(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerML(),
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
              key: pageKey,
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
          Categorias(),
          TarjetaArticulo(
            imagen:
                'https://http2.mlstatic.com/D_NQ_NP_2X_978094-MLM31368159703_072019-F.webp',
            titulo: 'Visto recientemente',
            nombre: 'Control Classic Gamepad Nintendo Wii Alambrico Nuevo',
            precio: '240',
            centavos: '81',
            descuento: '31',
            meses: '12',
            precioMeses: '24',
            centavosMeses: '18',
            boton: 'Ver historial de navegación',
          ),
          TarjetaArticulo(
            imagen:
                'https://http2.mlstatic.com/D_NQ_NP_2X_777618-MLA43485074635_092020-F.webp',
            titulo: 'Oferta del día',
            nombre: 'Motorola One Fusion+ 128 GB twilight blue 4 GB RAM',
            precio: '6,745',
            centavos: '00',
            descuento: '10',
            meses: '12',
            precioMeses: '562',
            centavosMeses: '08',
            boton: 'Ver todas las ofertas',
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
