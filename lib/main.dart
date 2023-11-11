import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:proyectoprincipal/Pages/index.dart';
import 'package:proyectoprincipal/repository/auth_repository.dart';
import 'package:proyectoprincipal/repository/implementacion/auth_repository.dart';
import 'package:proyectoprincipal/repository/implementacion/producto_repository.dart';
import 'package:proyectoprincipal/repository/producto_repository.dart';
import 'package:proyectoprincipal/services/firebase_service.dart';
import 'cubits/auth_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'navigation/routes.dart';

final getIt = GetIt.instance;
final _navigatorkey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await injectDependencies();

  runApp(
    BlocProvider(
      create: (_) => AuthCubit()..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state){
          if(state == AuthState.signedOut){
            _navigatorkey.currentState?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
          }else if(state == AuthState.signedIn){
            _navigatorkey.currentState?.pushNamedAndRemoveUntil(Routes.inicio, (r) => false);
          }
        },
      child: MaterialApp(
        navigatorKey: _navigatorkey,
        title: 'Distribuidora JLR SAC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.routes,
        /*
        initialRoute: '/',
        routes: {
          "/": (context) => Home(),
          "/inicio": (context) => Inicio(),
          "/catalogo": (context) => Catalogo(),
          "/productos": (context) => Productos(),
          //"/prueba": (context) => Prueba()
        }, */
      ),
    );
  }
}
Future<void> injectDependencies() async{
  getIt.registerLazySingleton(() => FirebaseService());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
  getIt.registerLazySingleton<ProductoRepository>(() => ProductoRepositoryImp());
}
