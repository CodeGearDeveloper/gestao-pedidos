import 'package:flutter/material.dart';
import 'package:gestao_pedidos/widget/tablet/garcon-item/garcon-item-tablet.dart';
import '../../../widget/button-simples/button-simples.dart';

class GarconsContentTablet extends StatefulWidget {
  const GarconsContentTablet({Key? key}) : super(key: key);

  @override
  State<GarconsContentTablet> createState() => _GarconsContentTabletState();
}

bool mostrarBuscar = false;
TextEditingController nomeGarconController = TextEditingController();

class _GarconsContentTabletState extends State<GarconsContentTablet> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Garçons",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container()),
            Container(
              child: Row(
                children: [
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
          ],
        ),
        SizedBox(height: 12),
        Divider(color: Colors.orange),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int i) {
                return GarconItemTablet();
              },
            ),
          ),
        ),
        SizedBox(
          width: fullwidth,
          child: ButtonSimples(
            title: "Novo Garçom",
            onPressed: () {
              alertCadGarcom(context);
            },
          ),
        ),
      ],
    );
  }

  alertCadGarcom(
    BuildContext context,
  ) {
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cadastrar novo Garçom", style: TextStyle(fontSize: 20)),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeGarconController,
                decoration: InputDecoration(
                  hintText: 'Nome do Garçom',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Salvar", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancelar", style: TextStyle(color: Colors.white))),
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
