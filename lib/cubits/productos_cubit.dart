

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';
import '../model/productos.dart';
import '../repository/producto_repository.dart';

class ProductosCubit extends Cubit<ProductosState>{
  final ProductoRepository _productoRepository = getIt();
  StreamSubscription? _productosSubscription;

  ProductosCubit(): super(const ProductosState());

  Future<void> init() async{
    _productosSubscription = _productoRepository.getproductos().listen(productoslisten);
  }
  void productoslisten(Iterable<Productos> productos) async{
    emit(ProductosState(
      isLoading: false,
      productos: productos,
    ));
  }

  @override
  Future<void> close(){
    _productosSubscription?.cancel();
    return super.close();
  }
}
class ProductosState extends Equatable{
  final bool isLoading;
  final Iterable<Productos> productos;

  const ProductosState({
    this.isLoading = true,
    this.productos = const [],
  });

  @override
  List<Object?> get props => [isLoading, productos];


}