import 'package:carrito/variables.dart';
import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  final List<Productos> _cart;

  const Carrito(this._cart, {super.key});

  @override
  _CarritoState createState() => _CarritoState(_cart);
}

class _CarritoState extends State<Carrito> {

  _CarritoState(this._cart);
  //creamos la funcion cart la cual usara los objetos de ListaProductos para retornar los productos creados
  List<Productos> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar de la pagina
      //contiene un boton en el lado izquierdo para reguresar a la pagina principal
      appBar: AppBar(
        title: const Text("Lista del carrito"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _cart.length;
              });
            }),
      ),
      body:
      //usamos ListView para la creacion de la lista principal de productos
      ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            //cada producto estara dentro de una card
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Creamos un container en el cual almacenaremos la imagen
                    Container(
                      width: 75,
                      height: 75,
                      child: Image(
                        image: NetworkImage(
                          _cart[index].imagen.toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    //Dentro del Exopanden encontraremos el titulo principaldel producto
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                _cart[index].name.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

}
