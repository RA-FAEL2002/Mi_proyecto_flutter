import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:proyectoprincipal/Pages/index.dart';

class Home extends StatelessWidget  {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Distribuidora JLR SAC")),
      body: _login()

      /*Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: 40,),
          Container(),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "https://lh3.googleusercontent.com/t6sPHEVwefEXTYVMaC8Hzjmp0RsnBxoaAK8b9rZcKsbNQymN_iRrzUJ1kWtev8uNVy0lHf8dq_7mCFYOpy3K7aHdKJ1GrEFoNg_KCKxkKozDlbbj-2KQddBtSXgKumkHqIo2jlM"
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: Text("Distribuidora JLR SAC",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),),
          ),
          FilledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Inicio(),));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home),
                  Text("Ingresar",
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
class _login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const SignInScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
      ],
    );
  }

}