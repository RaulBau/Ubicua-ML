import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';

class TarjetaArticulo extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String nombre;
  final String precio;
  final String centavos;
  final String descuento;
  final String meses;
  final String precioMeses;
  final String centavosMeses;
  final String boton;
  const TarjetaArticulo({
    @required this.imagen,
    @required this.titulo,
    @required this.nombre,
    @required this.precio,
    @required this.centavos,
    @required this.descuento,
    @required this.meses,
    @required this.precioMeses,
    @required this.centavosMeses,
    @required this.boton,
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
              FadeInImage(
                fit: BoxFit.cover,
                placeholder: Image.asset(
                  'assets/carga.png',
                  fit: BoxFit.cover,
                ).image,
                image: NetworkImage(this.imagen),height: 300,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        this.nombre,
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
                          text: '\$ ${this.precio}',
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -2),
                                child: Text(
                                  '${this.centavos}  ',
                                  textScaleFactor: 0.8,
                                  style:
                                      TextStyle(color: colores['grisOscuro']),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: '${this.descuento}% OFF',
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
                          text: '${this.meses}x \$ ${this.precioMeses}',
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -2),
                                child: Text('${this.centavosMeses}  ',
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
                      this.boton ,
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
