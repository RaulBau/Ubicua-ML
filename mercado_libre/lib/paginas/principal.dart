import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/login.dart';
import 'package:mercado_libre/widgets/appBar.dart';

class Principal extends StatefulWidget {
  static String routeName = 'principal';
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarML(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: IconButton(
                  iconSize: 45,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                        settings: RouteSettings(name: Login.routeName)));
                  },
                  icon: CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.network(
                      'https://cdn.discordapp.com/attachments/544378436156915714/755288728443813888/tu2.png',
                    ).image,
                  )),
              accountName: Text(''),
              accountEmail: Text(''),
              decoration: BoxDecoration(color: colores['amarillo']),
            ),
          ],
        ),
      ),
    );
  }
}
