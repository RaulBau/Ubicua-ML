import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/producto.dart';

class TarjetaArticulo extends StatelessWidget {
  final String titulo;
  final String boton;
  final articulo;
  const TarjetaArticulo({
    @required this.titulo,
    @required this.boton,
    @required this.articulo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  this.titulo,
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
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Producto(this.articulo);
                      },
                      settings: RouteSettings(name: Producto.routeName)));
                },
                padding: EdgeInsets.zero,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: Image.asset(
                    'assets/carga.png',
                    fit: BoxFit.cover,
                  ).image,
                  image: NetworkImage(this.articulo['imagen']),
                  height: 300,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        this.articulo['nombre'],
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: '\$ ${this.articulo['precio']}',
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -2),
                                child: Text(
                                  '${this.articulo['centavos']}  ',
                                  textScaleFactor: 0.8,
                                  style:
                                      TextStyle(color: colores['grisOscuro']),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: '${this.articulo['descuento']}% OFF',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text:
                              '${this.articulo['meses']}x \$ ${this.articulo['precioMeses']}',
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -2),
                                child:
                                    Text('${this.articulo['centavosMeses']}  ',
                                        textScaleFactor: 0.8,
                                        style: TextStyle(
                                          color: colores['verde'],
                                        )),
                              ),
                            ),
                            TextSpan(
                              text: 'sin interés',
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: colores['verde'],
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      'Envío gratis',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: colores['verde'],
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.flash_on_outlined,
                      size: 16,
                      color: colores['verde'],
                    ),
                    Expanded(
                      child: Text(
                        'FULL',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: colores['verde'],
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xfff2f2f2),
                height: 3,
                thickness: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        this.boton,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: colores['azulClaro'], fontSize: 15),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: colores['grisClaro'],
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
    );
  }
}
