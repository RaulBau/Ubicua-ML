import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/carrito.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/barraBusqueda.dart';
import 'package:mercado_libre/widgets/categorias.dart';
import 'package:mercado_libre/widgets/drawer.dart';
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

  var articulos = [
    {
      'imagen':
          'https://http2.mlstatic.com/D_NQ_NP_2X_978094-MLM31368159703_072019-F.webp',
      'nombre': 'Control Classic Gamepad Nintendo Wii Alambrico Nuevo',
      'precio': '240',
      'centavos': '81',
      'descuento': '31',
      'meses': '12',
      'precioMeses': '24',
      'centavosMeses': '18',
      'imagenes': [
        'https://http2.mlstatic.com/D_NQ_NP_2X_978094-MLM31368159703_072019-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_845594-MLM43677590269_102020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_721351-MLM43677612011_102020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_815758-MLM43677595245_102020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_834147-MLM43677567418_102020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_626777-MLM43677555518_102020-F.webp',
      ],
      'caracteristicas': [
        {'nombre': 'Color', 'op': 'Banco'},
        {'nombre': 'Nombre del diseño', 'op': 'Wii'},
      ]
    },
    {
      'imagen':
          'https://http2.mlstatic.com/D_NQ_NP_2X_777618-MLA43485074635_092020-F.webp',
      'nombre': 'Motorola One Fusion+ 128 GB twilight blue 4 GB RAM',
      'precio': '6,745',
      'centavos': '00',
      'descuento': '10',
      'meses': '12',
      'precioMeses': '562',
      'centavosMeses': '08',
      'imagenes': [
        'https://http2.mlstatic.com/D_NQ_NP_2X_777618-MLA43485074635_092020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_819368-MLA43485074636_092020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_697975-MLA43485074637_092020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_847377-MLA43485074639_092020-F.webp',
        'https://http2.mlstatic.com/D_NQ_NP_2X_709231-MLA43485157395_092020-F.webp'
      ],
      'caracteristicas': [
        {'nombre': 'Es Dual SIM', 'op': 'No'},
        {'nombre': 'Memoria RAM', 'op': '4 GB'},
        {'nombre': 'Color', 'op': 'Twilight Blue'},
      ]
    },
  ];

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: .9,
      initialPage: 5,
    );
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (pageKey.currentContext != null)
        pageController
            .nextPage(duration: Duration(milliseconds: 600), curve: Curves.ease)
            .catchError((err) {
          print(err);
        });
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
        title: BarraBusqueda(),
        bottom: Direccion(direccion: 'Ingresa tu código postal'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Carrito();
                  },
                  settings: RouteSettings(name: Carrito.routeName)));
            },
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
            titulo: 'Visto recientemente',
            articulo: articulos[0],
            boton: 'Ver historial de navegación',
          ),
          TarjetaArticulo(
            titulo: 'Oferta del día',
            articulo: articulos[1],
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
