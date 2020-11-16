import 'package:flutter/material.dart';
import 'package:mercado_libre/widgets/appBar.dart';
import 'package:mercado_libre/widgets/drawer.dart';

class Producto extends StatelessWidget {
  static String routeName = 'producto';
  const Producto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarML(),
      drawer: DrawerML(),
    );
  }
}
