import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:gestao_pedidos/controllers/controllers-list.dart';
import 'package:gestao_pedidos/pages/home-page/home-page.dart';
import 'package:gestao_pedidos/widget/auth-check.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

const apiKey = "AIzaSyCwfUMuLFiSUTqxHtBzGYtW6OZDpfdtRqQ";
const projectId = "pdv-f87d8";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Firestore.initialize(projectId);
  runApp(
    MultiProvider(
      providers: controllerList,
      child: MyApp(),
    ),
  );
}

String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Pedidos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: getDeviceType() == "phone" ? HomePage() : AuthCheck(),
    );
  }
}
