import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/widgets/search_delegate.dart';


class BarraBusqueda extends StatelessWidget {
  const BarraBusqueda({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 8),
      onPressed: () {
        showSearch(context: context, delegate: ProductSearch());
      },
      child: Row(
        children: [
          Icon(
            Icons.search_outlined,
            color: colores['grisClaro'],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Buscar en Mercado Libre',
              style: TextStyle(
                  color: colores['grisClaro'], fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      color: Colors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
