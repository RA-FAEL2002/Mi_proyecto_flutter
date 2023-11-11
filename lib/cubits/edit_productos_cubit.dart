


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoprincipal/repository/producto_repository.dart';

import '../main.dart';
import '../model/productos.dart';

class EditProductosCubit extends Cubit<EditProductosState>{
  final ProductoRepository _productoRepository = getIt();

  Productos? _toEdit;

  EditProductosCubit(this._toEdit) : super(const EditProductosState());


  Future<void> guardar(
      String nombre,
      double precio,
      String categoria,
      int cantidad,
      String descripcion,
      ) async {
    emit(state.copy(isLoading: true));

    final uid= _toEdit?.id ?? _productoRepository.newId();
    _toEdit = Productos(
        id: uid,
        nombre: nombre,
        precio: precio,
        categoria: categoria,
        cantidad: cantidad,
        descripcion: descripcion);

    await _productoRepository.guardar(_toEdit!);
    emit(state.copy(isDone: true));
  }

  Future<void> borrar() async{
    emit(state.copy(isLoading: true));
    if(_toEdit != null){
      await _productoRepository.borrar(_toEdit!);
    }
    emit(state.copy(isDone: true));
  }
}

class EditProductosState extends Equatable{
  final bool isLoading;

  final bool isDone;

  const EditProductosState({
    this.isLoading = false,
    this.isDone = false
  });

  @override
  List<Object?> get props => [isLoading, isDone];

  EditProductosState copy({
    bool? isLoading,
    bool? isDone,
  }){
    return EditProductosState(
      isLoading: isLoading ?? this.isLoading,
      isDone: isDone ?? this.isDone,
    );
  }

}
