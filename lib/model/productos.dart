import 'package:equatable/equatable.dart';

class Productos extends Equatable{
  final String id;
  final String nombre;
  final double precio;
  final String categoria;
  final int cantidad;
  final String descripcion;


  Productos({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
    required this.cantidad,
    required this.descripcion,
  });

  @override
  List<Object?> get props => [id, nombre,precio,categoria,cantidad,descripcion];

  Map<String, Object?> toFirebaseMap(){
    return <String, Object?>{
      'id': id,
      'nombre': nombre,
      'precio': precio,
      'categoria': categoria,
      'cantidad': cantidad,
      'descripcion': descripcion,
    };
  }


  Productos.fromFirebaseMap(Map<String, Object?> data)
      : id= data['id'] as String,
        nombre= data['nombre'] as String,
        precio= data['precio'] as double,
        categoria= data['categoria'] as String,
        cantidad= data['cantidad'] as int,
        descripcion= data['descripcion'] as String;

  Productos copy({
    String? id,
    String? nombre,
    double? precio,
    String? categoria,
    int? cantidad,
    String? descripcion
  }){
    return Productos(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      categoria: categoria ?? this.categoria,
      cantidad: cantidad ?? this.cantidad,
      descripcion: descripcion ?? this.descripcion,
    );
  }


}