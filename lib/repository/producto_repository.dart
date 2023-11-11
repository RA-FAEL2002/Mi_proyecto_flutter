import '../model/productos.dart';

abstract class ProductoRepository{
  String newId();

  Stream<Iterable<Productos>> getproductos();

  Future<void> guardar(Productos productos);

  Future<void> borrar(Productos productos);
}