import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import '../../model/productos.dart';
import '../../services/firebase_service.dart';
import '../producto_repository.dart';

class ProductoRepositoryImp extends ProductoRepository{
  final FirebaseService _fDataSource = getIt();

  @override
  Future<void> borrar(Productos productos) {
    return _fDataSource.borrar(productos);
  }

  @override
  Stream<Iterable<Productos>> getproductos() {
    return _fDataSource.getproductos();
  }

  @override
  Future<void> guardar(Productos productos) {
    return _fDataSource.guardar(productos);
  }

  @override
  String newId() {
    return _fDataSource.newId();
  }


}