import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProductSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar en Mercado Libre';
  TextStyle get searchFieldStyle =>
      TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey);
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.white,
      textTheme: TextTheme(headline6: TextStyle(color: Colors.grey)),
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
            caption: TextStyle(color: Colors.red),
            headline6: TextStyle(color: Colors.red)),
        color: Colors.white,
        elevation: 3,
      ),
    );
  }

  String seleccion = '';

  final busquedas = [
    'Sartenes',
    'Celulares',
    'Nokia',
    'Motorola',
    'Teclados',
    'Xbox',
    'Playstation',
    'Nitnendo Switch',
    'Cable HDMI',
  ];
  final busquedasRecientes = [
    'Mica cristal templado',
    'Cable usb',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del appBar
    return [
      // IconButton(
      //     icon: Icon(Icons.clear),
      //     splashRadius: 20,
      //     onPressed: () {
      //       query = '';
      //     }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appBar
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        splashRadius: 20,
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultaod que se muestran
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.grey,
        child: Text(seleccion),
      ),
    );
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Sugerencias que se muestran al escribir
  //   if (query.isEmpty) {
  //     return Container();
  //   } else {
  //     return FutureBuilder(
  //       future: busquedasProvider.buscarPelicula(query),
  //       builder:
  //           (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
  //         final busquedas = snapshot.data;
  //         if (snapshot.hasData) {
  //           return ListView(
  //             children: busquedas.map((pelicula) {
  //               return ListTile(
  //                 leading: FadeInImage(
  //                   placeholder: AssetImage('assets/img/no-image.jpg'),
  //                   image: NetworkImage(pelicula.getPosterImg()),
  //                   width: 50.0,
  //                   fit: BoxFit.contain,
  //                 ),
  //                 title: Text(pelicula.title),
  //                 subtitle: Text(pelicula.originalTitle),
  //                 onTap: () {
  //                   close(context, null);
  //                   pelicula.uniqueID = '';
  //                   Navigator.pushNamed(
  //                     context,
  //                     'detalle',
  //                     arguments: pelicula,
  //                   );
  //                 },
  //               );
  //             }).toList(),
  //           );
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       },
  //     );
  //   }
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que se muestran al escribir
    final listaSugerida = (query.isEmpty)
        ? busquedasRecientes
        : busquedas
            .where(
              (p) => p.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.watch_later_outlined),
          trailing: Transform.rotate(
            angle: 45 * math.pi / 180,
            child: Icon(Icons.arrow_back),
          ),
          title: Text(
            listaSugerida[i],
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
          ),
          onTap: () {
            // seleccion = listaSugerida[i];
            // showResults(context);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
