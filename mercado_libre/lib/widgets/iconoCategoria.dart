import 'package:flutter/material.dart';

class IconoCategoria extends StatelessWidget {
  final Color colorIcono;
  final Color colorFondo;
  final double diametro;
  final double diametroIcono;
  final EdgeInsets margin;
  final IconData icono;
  final String nombre;
  const IconoCategoria({
    this.colorIcono,
    this.colorFondo,
    this.diametro,
    this.diametroIcono,
    this.margin,
    this.nombre,
    @required this.icono,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.diametro != null ? this.diametro : 55,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: margin,
            child: Icon(this.icono,
                color: this.colorIcono == null
                    ? Colors.grey.withOpacity(.7)
                    : this.colorIcono),
            width: this.diametro != null ? this.diametro : 55,
            height: this.diametro != null ? this.diametro : 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: this.colorFondo != null ? this.colorFondo : Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 2,
                    offset: Offset(0, 3))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: this.diametro != null ? this.diametro : 55,
              child: Text(
                this.nombre != null ? this.nombre : '',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
