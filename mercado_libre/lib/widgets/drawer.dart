import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/login.dart';
import 'package:mercado_libre/paginas/principal.dart';

class DrawerML extends StatelessWidget implements Drawer {
  DrawerML({Key key})
      : child = null,
        elevation = null,
        semanticLabel = null,
        super(key: key);
  @override
  final Widget child;
  @override
  final double elevation;
  @override
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          ItemDrawer(
            icono: Icons.home_outlined,
            titulo: 'Inicio',
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return Principal();
              }), (route) => false);
            },
          ),
          ItemDrawer(icono: Icons.search_outlined, titulo: 'Buscar'),
          ItemDrawer(icono: Icons.shopping_bag_outlined, titulo: 'Mis compras'),
          ItemDrawer(icono: Icons.account_circle_outlined, titulo: 'Mi cuenta'),
          ItemDrawer(icono: Icons.label_outline, titulo: 'Vender'),
          ItemDrawer(icono: Icons.watch_later_outlined, titulo: 'Historial'),
          DividerDrawer(),
          ItemDrawer(
              icono: Icons.format_list_bulleted_outlined, titulo: 'Categorías'),
          ItemDrawer(
            icono: Icons.shopping_basket_outlined,
            titulo: 'Supermercado',
            nuevo: true,
          ),
          ItemDrawer(icono: Icons.home_outlined, titulo: 'Tiendas oficiales'),
          DividerDrawer(),
          ItemDrawer(icono: Icons.help_outline, titulo: 'Ayuda'),
          DividerDrawer(),
          ItemDrawer(titulo: 'Acerca de Mercado Libre'),
        ],
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final bool nuevo;
  final Function onTap;
  const ItemDrawer({
    this.titulo,
    this.icono,
    this.onTap,
    this.nuevo = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: this.titulo != null
          ? Text(
              this.titulo,
              style: TextStyle(fontSize: 15),
            )
          : null,
      leading: this.icono != null
          ? Icon(
              this.icono,
              color: colores['grisOscuro'],
              size: 30,
            )
          : null,
      trailing: this.nuevo == true
          ? Container(
              width: 50,
              height: 20,
              alignment: Alignment.center,
              child: Text(
                'NUEVO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
              decoration: BoxDecoration(
                  color: colores['azulClaro'],
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10), right: Radius.circular(10))),
            )
          : null,
      onTap: () {
        if (this.onTap != null) {
          this.onTap();
        }
      },
    );
  }
}

class DividerDrawer extends StatelessWidget {
  const DividerDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 1,
      indent: 18,
    );
  }
}
