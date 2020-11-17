import 'package:flutter/material.dart';
import 'package:mercado_libre/main.dart';

class ImagenesArticulo extends StatefulWidget {
  const ImagenesArticulo({
    Key key,
    @required this.imagenes,
  }) : super(key: key);

  final imagenes;

  @override
  _ImagenesArticuloState createState() => _ImagenesArticuloState();
}

class _ImagenesArticuloState extends State<ImagenesArticulo> {
  PageController pageController;
  int paginaActual;

  @override
  void initState() {
    paginaActual = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imagenes.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.contain,
                placeholder: Image.asset(
                  'assets/carga_blanco.png',
                  fit: BoxFit.cover,
                ).image,
                image: NetworkImage(widget.imagenes[index]),
              );
            },
            physics: BouncingScrollPhysics(),
            pageSnapping: true,
            onPageChanged: (val) {
              setState(() {
                this.paginaActual = val.toInt();
              });
            },
          ),
          Positioned(
              left: 15,
              child: Container(
                width: 50,
                height: 20,
                alignment: Alignment.center,
                child: Text(
                  '${(this.paginaActual + 1).toInt()}/${this.widget.imagenes.length}',
                  style: TextStyle(
                    color: colores['grisOscuro'],
                    fontSize: 10,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                decoration: BoxDecoration(
                    color: colores['grisClaro'],
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10))),
              )),
          Positioned(
              right: 15,
              bottom: 15,
              child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: IconButton(
                    icon: Icon(Icons.share_outlined),
                    onPressed: () {},
                    color: colores['grisOscuro'],
                    splashRadius: 15,
                  ))),
        ],
      ),
    );
  }
}
