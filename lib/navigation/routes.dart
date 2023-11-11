import 'package:flutter/material.dart';
import 'package:proyectoprincipal/Pages/Home.dart';
import 'package:proyectoprincipal/Pages/Inicio.dart';
import 'package:proyectoprincipal/Pages/carga.dart';
import 'package:proyectoprincipal/Pages/index.dart';




class Routes{
  static const carga = '/';
  static const home = '/home';
  static const inicio = '/inicio';
  static const catalogo = '/catalogo';
  static const productos = '/productos';

  static Route routes(RouteSettings settings){

    MaterialPageRoute buildRoute(Widget widget){
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name){
      case carga:
        return buildRoute(const Cargascreen());
      case home:
        return buildRoute(const Home());
      case inicio:
        return buildRoute(const Inicio());
      case catalogo:
        return buildRoute(const Catalogo());
      case productos:
        return buildRoute(const ProductosScreen());
      default:
        throw Exception('Ruta no existe');
    }
  }
}