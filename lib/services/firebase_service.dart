import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/productos.dart';

class FirebaseService{
  User get currentUser{
    final user = FirebaseAuth.instance.currentUser;
    if(user == null) throw Exception('error');
    return user;
  }
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  String newId(){
    return firestore.collection('tmp').doc().id;
  }

  Stream<Iterable<Productos>> getproductos(){
    return firestore
        .collection('user/${currentUser.uid}/productos')
        .snapshots()
        .map((it) => it.docs.map((e) => Productos.fromFirebaseMap(e.data())));
  }
  Future<void> guardar(Productos productos) async{
    final ref = firestore.doc('user/${currentUser.uid}/productos/${productos.id}');
    await ref.set(productos.toFirebaseMap(), SetOptions(merge: true));
  }
  Future<void> borrar(Productos productos) async{
    final ref = firestore.doc('user/${currentUser.uid}/productos/${productos.id}');
    await ref.delete();
  }
}










/*
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<List> getProductos() async{
  List productos = [];
  CollectionReference reference = firestore.collection("Productos");
  QuerySnapshot snapshot = await  reference.get();
  for (var e in snapshot.docs){
    productos.add(e.data());
  }
  return productos;
}

Future<void> insProductos (String nombre, int precio, String descripcion,int cantidad,String categoria, String imagen) async{
  await firestore.collection("Productos").add({
    "nombre": nombre,
    "cantidad": cantidad
  });
}*/