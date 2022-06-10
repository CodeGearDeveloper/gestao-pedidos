import 'package:flutter/material.dart';

class GarconItemTablet extends StatefulWidget {
  final String nome;
  final String email;
  GarconItemTablet({Key? key, required this.nome, required this.email}) : super(key: key);

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
              Text("Nome do Garçom:", style: TextStyle(fontSize: 18)),
              Text("${widget.nome}", style: TextStyle(fontSize: 16)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("E-mail:", style: TextStyle(fontSize: 18)),
              Text("${widget.email}", style: TextStyle(fontSize: 16)),
            ],
          ),
          Divider(color: Colors.orange),
        ],
      ),
    );
  }
}
