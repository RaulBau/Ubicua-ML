import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';
import 'package:mercado_libre/paginas/compraExitosa.dart';
import 'package:mercado_libre/paginas/login.dart';
import 'package:mercado_libre/paginas/principal.dart';
import 'package:mercado_libre/paginas/tarjeta.dart';

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
          // UserAccountsDrawerHeader(
          //   currentAccountPicture: Row(
          //     children: [
          //       IconButton(
          //           iconSize: 45,
          //           onPressed: () {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) {
          //                   return Login();
          //                 },
          //                 settings: RouteSettings(name: Login.routeName)));
          //           },
          //           icon: CircleAvatar(
          //             radius: 40,
          //             backgroundImage: Image.network(
          //               'https://cdn.discordapp.com/attachments/544378436156915714/755288728443813888/tu2.png',
          //             ).image,
          //           )),
          //       Column(
          //         children: [Text('Hola Raúl')],
          //       )
          //     ],
          //   ),
          //   accountName: Text(''),
          //   accountEmail: Text(''),
          //   decoration: BoxDecoration(color: colores['amarillo']),
          // ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: IconButton(
                          iconSize: 55,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                                settings:
                                    RouteSettings(name: Login.routeName)));
                          },
                          icon: CircleAvatar(
                            radius: 50,
                            backgroundImage: Image.network(
                              'https://cdn.discordapp.com/attachments/544378436156915714/755288728443813888/tu2.png',
                            ).image,
                          )),
                    ),
                    Expanded(
                      flex: 9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hola Raúl',
                              style: TextStyle(
                                color: colores['grisOscuro'],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nivel 3 - Mercado Puntos',
                                    style: TextStyle(
                                        color: colores['grisOscuro'],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: colores['azulClaro'],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfffff280),
                      borderRadius: BorderRadius.circular(20)),
                  width: double.infinity,
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 13),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.panorama_photosphere_select,
                          color: colores['azulClaro'],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Cantidad: ',
                          style: TextStyle(
                              color: colores['grisOscuro'], fontSize: 15),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: colores['azulClaro'],
                      )
                    ],
                  ),
                ),
              ],
            ),
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
          ItemDrawer(
            icono: Icons.shopping_bag_outlined,
            titulo: 'Mis compras',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return CompraExitosa();
                  },
                  settings: RouteSettings(name: CompraExitosa.routeName)));
            },
          ),
          ItemDrawer(
            icono: Icons.account_circle_outlined,
            titulo: 'Mi cuenta',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Tarjeta();
                  },
                  settings: RouteSettings(name: Tarjeta.routeName)));
            },
          ),
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
