import 'package:flutter/material.dart';

class TarjetaSlider extends StatelessWidget {
  final String imagen;
  const TarjetaSlider({
    @required this.imagen,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FlatButton(
        height: double.infinity,
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: ClipRRect(
          child: Image.asset(
            this.imagen,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}