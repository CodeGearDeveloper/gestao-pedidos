import 'package:flutter/material.dart';

class GarconItemTablet extends StatefulWidget {
  GarconItemTablet({Key? key}) : super(key: key);

  @override
  State<GarconItemTablet> createState() => _GarconItemTabletState();
}

class _GarconItemTabletState extends State<GarconItemTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nome do Garçom:", style: TextStyle(fontSize: 20)),
              Text("Alessandro Aguiar Brito", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(color: Colors.orange),
        ],
      ),
    );
  }
}
