import 'package:flutter/material.dart';
import 'package:proyectoprincipal/model/productos.dart';
import 'package:proyectoprincipal/services/firebase_service.dart';
import 'package:proyectoprincipal/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
/*
class Prueba extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _prueba();
}
TextEditingController nombreController = TextEditingController(text: "");

class _prueba extends State<Prueba>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: const Text(
            "Firebase",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "Tabla categoria",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: const Text("Nombre",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: listado1(),
        ),
        inputBox("Nombre", nombreController),
        const SizedBox(
          height: 20,
        ),
        /*ElevatedButton(
            onPressed: () async {
              print(getProductos());
              //print(nombreController.text);
              await insProductos(
                  nombreController.text)
                  .then((e) => {
                nombreController = TextEditingController(text: ""),
                //(context as Element).reassemble()
                setState(() {})
              });
            },
            child: const Text("Agregar"))*/
      ],
    );
  }
}

Widget inputBox(String texto, controlador) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 40),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
        borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    /*child: TextFormField(
      controller: controlador,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: "Ingresar ${texto.toLowerCase()}",
        labelText: texto,
        border: InputBorder.none,
      ),
    ),*/
  );
}

  Widget listado1(){
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
                      snapshot.data?[index]['nombre'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
  } */