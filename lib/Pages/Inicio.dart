import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoprincipal/Pages/index.dart';
import 'package:proyectoprincipal/cubits/auth_cubit.dart';

class Inicio extends StatelessWidget{
  const Inicio({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _inicio(text: 'Bienvenido', imagepath: 'JLRSAC.png')
    );
  }
}



class _inicio extends StatelessWidget{
  final String text;
  final String imagepath;

  const _inicio({
    super.key,
    required this.text,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Distribuidora JLR SAC"),
        actions: [
          IconButton(
              onPressed: (){
                final authcubit = context.read<AuthCubit>();
                authcubit.signOut();
              },
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            botonBarra(context, "Inicio", Icons.person, "/inicio"),
            botonBarra(context, "Catalogo", Icons.category, "/catalogo"),
            botonBarra(context, "Productos", Icons.edit, "/productos"),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagepath,
              width: 200,
              height: 200,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),

      /*body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _cuadro(),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "https://i0.wp.com/sonria.com/wp-content/uploads/2016/08/2165947w620.jpg?fit=620%2C348&ssl=1"
            ),
          ),
          FilledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Home(),));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.exit_to_app),
                  Text("Cerrar Sesion",
                    style: TextStyle(
                        fontSize: 25
                    ),)
                ],
              )
          ),
        ],
      ),*/
    );
  }

}
/*
_cuadro(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 70.0,
      width: 370,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('JLRSAC.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}*/



Widget botonBarra(BuildContext context,
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
      ));
}