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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconoCategoria(
                  icono: Icons.qr_code_outlined,
                  colorFondo: Colors.white,
                  diametro: 55,
                  nombre: "Pagar con QR",
                ),
                IconoCategoria(
                  icono: Icons.label,
                  colorFondo: Colors.white,
                  diametro: 55,
                  nombre: "Ofertas",
                ),
                IconoCategoria(
                  icono: Icons.shopping_basket,
                  colorFondo: Colors.white,
                  diametro: 55,
                  nombre: "Supermercado",
                ),
                IconoCategoria(
                  icono: Icons.car_repair,
                  colorFondo: Colors.white,
                  diametro: 55,
                  nombre: "Autos, motos y otros",
                ),
                IconoCategoria(
                  icono: Icons.add,
                  colorFondo: Colors.white,
                  diametro: 55,
                  nombre: "Ver más",
                ),
              ],
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        'Visto recientemente',
                        style: TextStyle(
                            color: colores['grisOscuro'],
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xfff2f2f2),
                  height: 3,
                  thickness: 2,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: Image.asset(
                        'assets/carga.png',
                        fit: BoxFit.cover,
                      ).image,
                      image: NetworkImage(
                          'https://http2.mlstatic.com/D_NQ_NP_2X_978094-MLM31368159703_072019-F.webp'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Control Classic Gamepad Nintendo Wii Alambrico Nuevo',
                              style: TextStyle(
                                  color: colores['grisOscuro'],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: '\$ 240',
                                children: [
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(2, -2),
                                      child: Text(
                                        '81  ',
                                        textScaleFactor: 0.8,
                                        style: TextStyle(
                                            color: colores['grisOscuro']),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '31% OFF',
                                    children: [],
                                    style: TextStyle(
                                        color: colores['verde'],
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                style: TextStyle(
                                    color: colores['grisOscuro'],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            elevation: 10,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
