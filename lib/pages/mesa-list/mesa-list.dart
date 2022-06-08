import 'package:flutter/material.dart';
import 'package:gestao_pedidos/widget/button-simples/button-simples.dart';

class MesaList extends StatefulWidget {
  MesaList({Key? key}) : super(key: key);

  @override
  State<MesaList> createState() => _MesaListState();
}

class _MesaListState extends State<MesaList> {
  @override
  Widget build(BuildContext context) {
    // GlobalKey btnPedido = GlobalKey();
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fulano",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(0, 174, 224, 0.08),
        child: Stack(
          children: [
            Container(
              height: fullHeight - 47 - 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/mesa.png",
                            height: 90,
                          ),
                          Text("Mesa numero ${index + 1}"),
                          Column(
                            children: [
                              index == 0 ? Image.asset("assets/mesaDisponivel.png") : Image.asset("assets/mesaOcupada.png"),
                              Text(
                                index == 0 ? "Mesa Disponivel" : "Mesa Ocupada",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: fullHeight,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: fullwidth,
                    child: ButtonSimples(
                      onPressed: () {},
                      title: "Abrir nova mesa",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
