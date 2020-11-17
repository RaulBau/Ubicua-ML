import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/drawer.dart';

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
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerML(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(13),
            child: Text('Nuevo | ${Random().nextInt(2000)} vendidos',
                style: TextStyle(color: colores['grisClaro'])),
          ),
          ImagenesArticulo(imagenes: widget.articulo['imagenes']),
        ],
      ),
    );
  }
}

class ImagenesArticulo extends StatefulWidget {
  const ImagenesArticulo({
    Key key,
    @required this.imagenes,
  }) : super(key: key);

  final imagenes;

  @override
  _ImagenesArticuloState createState() => _ImagenesArticuloState();
}

class _ImagenesArticuloState extends State<ImagenesArticulo> {
  PageController pageController;
  int paginaActual;

  @override
  void initState() {
    paginaActual = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imagenes.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.contain,
                placeholder: Image.asset(
                  'assets/carga_blanco.png',
                  fit: BoxFit.cover,
                ).image,
                image: NetworkImage(widget.imagenes[index]),
              );
            },
            physics: BouncingScrollPhysics(),
            pageSnapping: true,
            onPageChanged: (val) {
              setState(() {
                this.paginaActual = val.toInt();
              });
            },
          ),
          Positioned(
              left: 15,
              child: Container(
                width: 50,
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  '${(this.paginaActual + 1).toInt()}/${this.widget.imagenes.length}',
                  style: TextStyle(
                    color: colores['grisOscuro'],
                    fontSize: 10,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                decoration: BoxDecoration(
                    color: colores['grisClaro'],
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10))),
              ))
        ],
      ),
    );
  }
}
