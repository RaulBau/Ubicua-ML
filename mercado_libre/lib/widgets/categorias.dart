import 'package:flutter/material.dart';
import 'package:mercado_libre/widgets/iconoCategoria.dart';

class Categorias extends StatelessWidget {
  const Categorias({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
