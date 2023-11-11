import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoprincipal/cubits/productos_cubit.dart';
import 'package:proyectoprincipal/services/firebase_service.dart';
import 'package:proyectoprincipal/model/productos.dart';

import '../navigation/routes.dart';


class Catalogo extends StatelessWidget{
  const Catalogo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Distribuidora JLR SAC"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.search,
                  semanticLabel: 'search',
                ),
                onPressed: (){
                  print('search button');
                }
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              botonBarra1(context, "Inicio", Icons.person, "/inicio"),
              botonBarra1(context, "Catalogo", Icons.category, "/catalogo"),
              botonBarra1(context, "Productos", Icons.edit, "/productos"),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => ProductosCubit()..init(),
          child: BlocBuilder<ProductosCubit, ProductosState>(
            builder: (context, state){
              return ListView.builder(
                itemCount: state.productos.length,
                itemBuilder: (context, index){
                  final productos = state.productos.elementAt(index);
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.productos,
                        arguments: productos);
                      },
                      leading: SizedBox(
                        height: 45,
                        width: 45,
                      ),
                      title: Text('${productos.nombre}'),
                      subtitle: Text('${productos.descripcion} | Cantidad: ${productos.cantidad}'),
                    ),
                  );
                },
              );
            },
          ),
        ),
    );
  }


}

/*
class _Catalogo extends State<Catalogo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Distribuidora JLR SAC"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: (){
                print('search button');
              }
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            botonBarra1(context, "Inicio", Icons.person, "/inicio"),
            botonBarra1(context, "Catalogo", Icons.category, "/catalogo"),
            botonBarra1(context, "Productos", Icons.edit, "/productos"),
            botonBarra1(context, "Salir", Icons.exit_to_app, "/"),
          ],
        ),
      ),
      body : Padding(
        padding: EdgeInsets.all(20),
        child: listado(),
      ),
      /* body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 9.0 / 10.0,
          children: _agregarespacios(20)
      ),*/
    );


  }

}*/
/*
List<Card> _agregarespacios(int count){
  List<Card> cards = List.generate(
    count,
        (int index){
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 20.0 / 12.0,
              /*child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/aceite.jpg'))
                    ),
                  ),*/
              child: Image.asset('aceite.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('ACEITE PRIMOR'),
                  const SizedBox(height: 8.0),
                  Text('500 ml'),
                  const SizedBox(height: 8.0),
                  Text('S/ 12.00'),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
  return cards;
}
*/

Widget botonBarra1(BuildContext context,
    String texto, icono, String ruta){
  return TextButton(
      onPressed: (){
        Navigator.pushNamed(context, ruta);
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20
          )
      ),
      child: Row(
        children: [
          Icon(icono),
          Text(texto,style: TextStyle(fontSize: 20),)
        ],
      )
  );
}
/*
Widget listado(){
  return FutureBuilder(
      future: getProductos(),
      builder: ((context, snapshot){
        if(snapshot.hasData){
          if(snapshot.hasError){
            Navigator.pushNamed(context, "error");
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return Row(
                children: [
                  Text(
                    snapshot.data?[index]['cantidad'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(snapshot.data?[index]['categoria']),
                  Text(snapshot.data?[index]['descripcion']),
                  Text(snapshot.data?[index]['imagen']),
                  Text(snapshot.data?[index]['nombre']),
                  Text(snapshot.data?[index]['precio']),
                ],
              );
            },
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }));
}*/