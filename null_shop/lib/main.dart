import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:null_shop/service/auth_service.dart';
import 'package:null_shop/service/database_sevice.dart';
import 'package:null_shop/themes/style.dart';
import 'package:null_shop/route.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
        child: Text('${details.exception}',
            style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.bold)));
  };
  runApp(const Myapp());
}

final messageKey = GlobalKey<ScaffoldMessengerState>();

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(create: (_) => DatabaseService()),
        ProxyProvider<DatabaseService, AuthService>(
            update: (_, dbService, __) => AuthService(dbService: dbService))
      ],
      child: MaterialApp(
        scaffoldMessengerKey: messageKey,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        initialRoute: '/login',
        routes: routes,
      ),
    );
  }
}
