import 'package:carrito/variables.dart';
import 'package:flutter/material.dart';
import 'package:carrito/carrito.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'carrito de compras',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //creamos la funcion lista la cual usara los objetos de variables para la creacion de los productos
  List<Productos> _catalogo =<Productos>[];

  final List<Productos> _listacarrito = <Productos>[];

  @override
  //usamos el metodo initState para crear el producto 1 vez
  void initState(){
    super.initState();
    _productos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //se crea un appbar suele ser el componente superior de la aplicación
      appBar: AppBar(
        title: const Text("Productos"),
        actions: [
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.shop),
                  onPressed: (){
                    if(_listacarrito.isNotEmpty){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=> Carrito(_listacarrito),
                        ),
                      );
                    }
                  }),
            ],
          )
        ],
      ),
      //usamos listview para crear la lista principal
      body: ListView.builder(itemCount: _catalogo.length,
          itemBuilder: (context, index) {
            //cada producto estara dentro de una card
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
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
                          _catalogo[index].imagen.toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    //Dentro del Exopanden encontraremos el titulo principaldel producto
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                _catalogo[index].name.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 1),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                _catalogo[index].price.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //Con setState aremos el cabio de estado dentro la lista de carrito esto es para inclui
                        //los productos en la lista del carro
                        setState(() {
                          if (_catalogo[index].isAdd!) {
                          } else {
                            _listacarrito.add(_catalogo[index]);
                            _catalogo[index].isAdd = true;
                          }
                        });
                      },
                      icon: Icon( Icons.add_circle_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        //Con setState aremos el cabio de estado dentro la lista de carrito esto es para inclui
                        //los productos en la lista del carro
                        setState(() {
                          if (_catalogo[index].isAdd!) {
                          } else {

                          }
                        });
                      },
                      icon: Icon( Icons.exit_to_app),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }


  void _productos() {
    var list = <Productos>[
      //Creamos los productos por el constructor de la clase ListaProductos
      Productos(name: "Manzana", imagen: "../images/manzana.jpg", price: "COL.500", id: 1, isAdd: false),
      Productos(name: "Banano", imagen: "../images/banano.jpg", price: "COL.600", id: 2, isAdd: false),
      Productos(name: "Papa", imagen: "../images/papa.jpg", price: "COL.400", id: 3, isAdd: false),
      Productos(name: "Uva", imagen: "../images/uva.jpg", price: "COL.800", id: 4, isAdd: false),
      Productos(name: "Zanahoria", imagen: "../images/zanahoria.webp", price: "COL.500", id: 5, isAdd: false),


    ];
    setState(() {
      //_list recibira el listado de productos para ser utilizado en las funciones principales del codigo
      _catalogo = list;
    });
  }
}
