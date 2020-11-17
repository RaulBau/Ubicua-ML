import 'package:flutter/material.dart';

class CompraExitosa extends StatelessWidget {
  static String routeName = 'compra-exitosa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),
            Text(
              '¡Felicidades tu pago fue aprobado!',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Concepto:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 380,
                    child: Divider(
                      height: 2,
                      color: Colors.black26,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "Esto es un producto que se compro",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Detalle del pago:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.black26,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 25,
                        ),
                        Text("Pago Aprobado"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("15000"),
                        Icon(Icons.people_rounded),
                        Text(
                            "Esto es una tarjata de credito/debito-con \nterminacion  en 1701")
                      ],
                    ),
                  ),
                  Text(
                    "Referencia de pago: 2097452125",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Código de autorizacion: 20925",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Tipo de pago: Debito",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Tipo de cuenta: venta Debito",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Numero de cuotas: 0",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Estado: Aprovado",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Estado: Aprovado",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Estos datos te los enviaremos a tu correo",
            ),
          ],
        ),
      ),
    ));
  }
}
