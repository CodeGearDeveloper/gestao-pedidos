import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:gestao_pedidos/pages/home-page/home-page.dart';
import 'package:gestao_pedidos/pages/tablet/principal-tablet/principal-tablet.dart';

const apiKey = "AIzaSyCwfUMuLFiSUTqxHtBzGYtW6OZDpfdtRqQ";
const projectId = "pdv-f87d8";
void main() {
  Firestore.initialize(projectId);
  runApp(const MyApp());
}

String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(getDeviceType());
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: getDeviceType() == "phone" ? HomePage() : PrincipalTablet(),
    );
  }
}
