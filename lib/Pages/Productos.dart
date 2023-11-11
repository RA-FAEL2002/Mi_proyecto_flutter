import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectoprincipal/cubits/edit_productos_cubit.dart';

import '../model/productos.dart';

class ProductosScreen extends StatelessWidget{
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productoEdit = ModalRoute.of(context)?.settings.arguments as Productos?;
    return BlocProvider(
      create: (context) => EditProductosCubit(productoEdit),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Distribuidora JLR SAC"),
          actions: [
            Builder(builder: (context){
              return Visibility(
                  visible: productoEdit != null,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: (){
                      context.read<EditProductosCubit>().borrar();
                    },
                  ),
              );
            }),
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              botonBarra2(context, "Inicio", Icons.person, "/inicio"),
              botonBarra2(context, "Catalogo", Icons.category, "/catalogo"),
              botonBarra2(context, "Productos", Icons.edit, "/productos"),
            ],
          ),
        ),

        body: BlocConsumer<EditProductosCubit, EditProductosState>(
          listener: (context, state){
            if (state.isDone){
              Navigator.of(context).pop();
            }
          },
          builder: (_, state){
            return Stack(
              children: [
                _ProductoSection(
                  producto: productoEdit,
                  Guardado: state.isLoading,
                ),
                if (state.isLoading)
                  Container(
                    color: Colors.black12,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            );

          },
        ),
      ),
        );
  }
  
}
class _ProductoSection extends StatefulWidget{
  final Productos? producto;
  final bool Guardado;

  const _ProductoSection({
    this.producto,
    this.Guardado = false
  });

  @override
  _ProductoSectionState createState() => _ProductoSectionState();
}

class _ProductoSectionState extends State<_ProductoSection>{
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _descripcionController = TextEditingController();

  @override
  void initState(){
    _nombreController.text = widget.producto?.nombre ?? '';
    _precioController.text = widget.producto?.precio.toString() ?? '';
    _categoriaController.text = widget.producto?.categoria ?? '';
    _cantidadController.text = widget.producto?.cantidad.toString() ?? '';
    _descripcionController.text = widget.producto?.descripcion ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'NOMBRE'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'PRECIO'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _categoriaController,
              decoration: const InputDecoration(labelText: 'CATEGORIA'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'CANTIDAD'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(labelText: 'DESCRIPCION'),
            ),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: widget.Guardado
                  ? null
                  : (){
                context.read<EditProductosCubit>().guardar(
                    _nombreController.text,
                    double.tryParse(_precioController.text) ?? 0,
                    _categoriaController.text,
                    int.tryParse(_cantidadController.text) ?? 0,
                    _descripcionController.text
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),


    );

  }




}
/*
class _Productos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final productoEdit = ModalRoute.of(context)?.settings.arguments as Productos?;
    return Scaffold(
      appBar: AppBar(
        title: Text("Distribuidora JLR SAC"),
        actions: [
          Builder(builder: (context){
            return Visibility(
                visible: productoEdit != null,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: (){
                    context.read<EditProductosCubit>().borrar();
                  },
                ))
          }),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            botonBarra2(context, "Inicio", Icons.person, "/inicio"),
            botonBarra2(context, "Catalogo", Icons.category, "/catalogo"),
            botonBarra2(context, "Productos", Icons.edit, "/productos"),
            botonBarra2(context, "Salir", Icons.exit_to_app, "/"),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          SizedBox(
            width: 250,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "NOMBRE",
              ),
            ),
          ),

          SizedBox(
            width: 250,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "PRECIO",
              ),
            ),
          ),

          SizedBox(
            width: 250,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "DESCRIPCION",
              ),
            ),
          ),


          SizedBox(
            width: 250,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "CANTIDAD",
              ),
            ),
          ),

          SizedBox(
            width: 250,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "CATEGORIA",
              ),
            ),
          ),

          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('aceite.jpg'),
          ),
          ElevatedButton(onPressed: () {
            print("guardado");
          }, child: Text("Guardar"),
          ),
          ElevatedButton(onPressed: (){
            print("cancelado");
          }, child: Text("Cancelar")
          ),
        ],
      ),
    );
  }
}
*/



Widget botonBarra2(BuildContext context,
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