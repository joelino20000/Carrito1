//esta clase se unsara para iniciar variables y crear los productos

class Productos{
  final String name;
  final String imagen;
  final String price;
  final int? id;
  late final bool? isAdd;

  Productos({required this.name, required this.imagen, required this.price, required this.id, required this.isAdd});
}