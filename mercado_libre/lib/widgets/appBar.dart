import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/widgets/search_delegate.dart';

class AppbarML extends StatefulWidget implements PreferredSizeWidget {
  AppbarML({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight * 1.8),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  _AppbarMLState createState() => _AppbarMLState();
}

class _AppbarMLState extends State<AppbarML> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsIconTheme: IconThemeData(color: colores['grisOscuro']),
      iconTheme: IconThemeData(color: colores['grisOscuro']),
      backgroundColor: colores['amarillo'],
      title: FlatButton(
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
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.pin_drop_outlined,
                color: colores['grisOscuro'],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Ingresa tu código postal',
                  style: TextStyle(
                      color: colores['grisOscuro'],
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 18,
                color: colores['grisOscuro'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
