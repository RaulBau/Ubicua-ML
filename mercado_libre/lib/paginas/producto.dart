import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/carrito.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/drawer.dart';
import 'package:mercado_libre/widgets/imagenesArticulo.dart';
import 'package:mercado_libre/widgets/search_delegate.dart';

class Producto extends StatefulWidget {
  static String routeName = 'producto';
  final articulo;
  const Producto(this.articulo, {Key key}) : super(key: key);

  @override
  _ProductoState createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  PageController pageController;
  int paginaActual = 0;

  @override
  void initState() {
    pageController = PageController();
    paginaActual = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarML(
        title: Text(
          'Producto',
          style: TextStyle(
              color: colores['grisOscuro'], fontWeight: FontWeight.w400),
        ),
        bottom: Direccion(direccion: 'Ingresa tu código postal'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearch());
            },
          ),
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
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: Text('Nuevo | ${Random().nextInt(2000)} vendidos',
                style: TextStyle(color: colores['grisClaro'])),
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: Text(widget.articulo['nombre'],
                style: TextStyle(color: colores['girsOscuro'], fontSize: 16)),
          ),
          Estrellas(),
          ImagenesArticulo(imagenes: widget.articulo['imagenes']),
          Padding(
              padding: EdgeInsets.all(13),
              child: Column(
                children: List<Widget>.generate(
                    widget.articulo['caracteristicas'].length,
                    (index) => Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 50,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                      text: widget.articulo['caracteristicas']
                                              [index]['nombre'] +
                                          ': ',
                                      children: [
                                        TextSpan(
                                          text:
                                              widget.articulo['caracteristicas']
                                                  [index]['op'],
                                          style: TextStyle(
                                              color: colores['grisOscuro'],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                  style: TextStyle(
                                      color: colores['grisOscuro'],
                                      fontSize: 15),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: colores['azulClaro'],
                              )
                            ],
                          ),
                        )),
              )),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                        text: '\$ ${widget.articulo['precio']} \n',
                        children: [
                          TextSpan(
                              text: 'en ',
                              style: TextStyle(
                                  color: colores['grisOscuro'], fontSize: 18),
                              children: [
                                TextSpan(
                                  text:
                                      '${widget.articulo['meses']}x ${widget.articulo['precioMeses']}',
                                  style: TextStyle(
                                      color: colores['verde'], fontSize: 18),
                                ),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0, -8),
                                    child: Text(
                                      '${widget.articulo['centavosMeses']}  ',
                                      textScaleFactor: 0.8,
                                      style: TextStyle(color: colores['verde']),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'sin interés \n',
                                  style: TextStyle(
                                      color: colores['verde'], fontSize: 18),
                                ),
                                TextSpan(
                                  text: 'IVA incluido \n',
                                  style: TextStyle(
                                      color: colores['grisOscuro'],
                                      fontSize: 18),
                                ),
                                TextSpan(
                                  text: 'Ver los medios de pago',
                                  style: TextStyle(
                                      color: colores['azulClaro'],
                                      fontSize: 16),
                                ),
                              ]),
                        ]),
                    style:
                        TextStyle(color: colores['grisOscuro'], fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.local_shipping_outlined,
                    color: colores['verde'],
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Envío gratis a todo el país',
                          style:
                              TextStyle(color: colores['verde'], fontSize: 16),
                        ),
                        Icon(
                          Icons.flash_on_outlined,
                          size: 16,
                          color: colores['verde'],
                        ),
                        Text(
                          'FULL',
                          style: TextStyle(
                              color: colores['verde'],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Conoce los tiempos y las formas de envío',
                      style: TextStyle(
                        color: colores['grisClaro'],
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pin_drop_outlined,
                          size: 16,
                          color: colores['azulClaro'],
                        ),
                        Text(
                          'Calcular cuándo llega',
                          style: TextStyle(
                            color: colores['azulClaro'],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                        text: 'Tienda oficial ',
                        style: TextStyle(
                            color: colores['grisOscuro'], fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Tienda \n',
                            style: TextStyle(
                                color: colores['azulClaro'], fontSize: 14),
                          ),
                          TextSpan(
                            text: '${Random().nextInt(20000)} ventas',
                            style: TextStyle(
                                color: colores['grisOscuro'], fontSize: 14),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: Text('Stock disponible',
                style: TextStyle(
                    color: colores['girsOscuro'],
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(text: 'Cantidad: ', children: [
                    TextSpan(
                      text: '1  ',
                      style: TextStyle(
                          color: colores['grisOscuro'],
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                  style: TextStyle(color: colores['grisOscuro'], fontSize: 15),
                ),
                Expanded(
                    child: Text(
                  '(${Random().nextInt(2000)} disponibles)',
                  style: TextStyle(color: colores['grisClaro'], fontSize: 17),
                )),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: colores['azulClaro'],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: FlatButton(
                height: 50,
                color: colores['azulClaro'],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Text(
                  'Comprar ahora',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: FlatButton(
                height: 50,
                color: Color(0xffe3edfb),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Text(
                  'Agregar al carrito',
                  style: TextStyle(color: colores['azulClaro'], fontSize: 18),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 13, left: 13, right: 13),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.keyboard_return_outlined,
                          size: 20,
                          color: colores['grisClaro'],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Text.rich(TextSpan(
                            text: 'Devolución gratis. ',
                            style: TextStyle(
                                color: colores['azulClaro'], fontSize: 16),
                            children: [
                              TextSpan(
                                  text: 'Tienes 30 dias desde que lo recibes.',
                                  style: TextStyle(
                                      color: colores['grisClaro'],
                                      fontSize: 16))
                            ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.shield,
                          size: 20,
                          color: colores['grisClaro'],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Text.rich(TextSpan(
                            text: 'Compra protegida. ',
                            style: TextStyle(
                                color: colores['azulClaro'], fontSize: 16),
                            children: [
                              TextSpan(
                                  text:
                                      ', recibe el producto que esperabas o te devolvemos tu dinero',
                                  style: TextStyle(
                                      color: colores['grisClaro'],
                                      fontSize: 16))
                            ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.wine_bar_outlined,
                          size: 20,
                          color: colores['grisClaro'],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Text.rich(TextSpan(
                            text: 'Mercado Puntos. ',
                            style: TextStyle(
                                color: colores['azulClaro'], fontSize: 16),
                            children: [
                              TextSpan(
                                  text:
                                      'Sumas ${Random().nextInt(2000)} puntos',
                                  style: TextStyle(
                                      color: colores['grisClaro'],
                                      fontSize: 16))
                            ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: colores['azulClaro'],
                          ),
                          Text(
                            'Agregar a favoritos',
                            style: TextStyle(
                                color: colores['azulClaro'], fontSize: 15),
                          )
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: colores['azulClaro'],
                          ),
                          Text(
                            'Compartir',
                            style: TextStyle(
                                color: colores['azulClaro'], fontSize: 15),
                          )
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xffededed),
            thickness: 1,
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class Estrellas extends StatelessWidget {
  const Estrellas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13, right: 13, bottom: 13),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            color: colores['azulClaro'],
            size: 14,
          ),
          Icon(
            Icons.star,
            color: colores['azulClaro'],
            size: 14,
          ),
          Icon(
            Icons.star,
            color: colores['azulClaro'],
            size: 14,
          ),
          Icon(
            Icons.star,
            color: colores['azulClaro'],
            size: 14,
          ),
          Icon(
            Icons.star,
            color: colores['azulClaro'],
            size: 14,
          ),
          Text('  (${Random().nextInt(100)})',
              style: TextStyle(color: colores['grisClaro'])),
        ],
      ),
    );
  }
}
