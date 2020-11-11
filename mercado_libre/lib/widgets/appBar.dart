import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';

class AppbarML extends StatefulWidget implements PreferredSizeWidget {
  AppbarML({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
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
      elevation: 0,
    );
  }
}
