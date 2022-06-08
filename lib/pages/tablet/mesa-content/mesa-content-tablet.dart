import 'package:flutter/material.dart';

import 'mesa-item/mesa-item-tablet.dart';

class MesaContentTablet extends StatefulWidget {
  MesaContentTablet({Key? key}) : super(key: key);

  @override
  State<MesaContentTablet> createState() => _MesaContentTabletState();
}

var mesas = [];
bool mostrarBuscar = false;
gerarMesas() {
  for (var i = 0; i < 16; i++) {
    mesas.add("");
  }
}

class _MesaContentTabletState extends State<MesaContentTablet> {
  @override
  Widget build(BuildContext context) {
    mesas.length == 0 ? gerarMesas() : null;
    // ignore: unused_local_variable
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Mesas",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Container(
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      width: mostrarBuscar ? fullwidth * 0.2 : 0,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          mostrarBuscar = !mostrarBuscar;
                        });
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: Colors.orange),
          SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 15,
                  children: [
                    for (var i = 0; i < mesas.length; i++)
                      MesaItemTablet(
                        nome: "Mesa ${i + 1}",
                        status: false,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
