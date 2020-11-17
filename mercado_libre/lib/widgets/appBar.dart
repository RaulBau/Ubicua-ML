import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/cp.dart';

class AppbarML extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String direccion;
  final Widget title;
  final Widget bottom;
  AppbarML({
    Key key,
    this.actions,
    this.title,
    this.bottom,
    this.direccion = 'Ingresa tu código postal',
  })  : preferredSize = Size.fromHeight(kToolbarHeight * 1.8),
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
      title: widget.title,
      elevation: 0,
      actions: this.widget.actions,
      bottom: widget.bottom,
    );
  }
}

class Direccion extends StatelessWidget implements PreferredSizeWidget {
  const Direccion({
    Key key,
    @required this.direccion,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String direccion;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return CodPost();
                                },
                                settings:
                                    RouteSettings(name: CodPost.routeName)));
        },
        child: Row(
          children: [
            Icon(
              Icons.pin_drop_outlined,
              color: colores['grisOscuro'],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                direccion,
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
    );
  }
}
