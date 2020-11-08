import 'package:flutter/material.dart';
import 'package:mercado_libre/paginas/principal.dart';

void main() => runApp(MyApp());

final colores = {
  "amarillo": Color(0xffFFE600),
  "lila": Color(0xffED195B),
  "grisOscuro": Color(0xff333333),
  "grisClaro": Color(0xffCCCCCC),
  "azul": Color(0xff2D3277)
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Principal(),
    );
  }
}
