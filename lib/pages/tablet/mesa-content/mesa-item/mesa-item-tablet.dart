import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MesaItemTablet extends StatefulWidget {
  final String nome;
  late bool status;
  MesaItemTablet({Key? key, required this.nome, required this.status}) : super(key: key);

  @override
  State<MesaItemTablet> createState() => _MesaItemTabletState();
}

class _MesaItemTabletState extends State<MesaItemTablet> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Container(
      width: fullwidth * 0.18,
      height: fullHeight * 0.15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 174, 224, 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            left: -25,
            bottom: -20,
            child: Image.asset(
              "assets/mesa.png",
              height: 130,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 0, right: 25, top: 0),
            width: fullwidth * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      widget.nome,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.status != true ? "Livre" : "Ocupado",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: widget.status != true ? Colors.green : Colors.red,
                      ),
                    ),
                    Switch(
                      value: widget.status,
                      onChanged: (value) {
                        alertFecharMesa(context);
                        // setState(() {
                        //   widget.status = !widget.status;
                        // });
                      },
                      activeTrackColor: Colors.red,
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  alertFecharMesa(
    BuildContext context,
  ) {
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(widget.status == false ? "Abrir Mesa ?" : "Fechar Mesa ?", style: TextStyle(fontSize: 20)),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              widget.status == true
                  ? Text(
                      "Ao fechar a mesa, voce sera direcionado para area de pagamento.",
                      style: TextStyle(fontSize: 15),
                    )
                  : Text(
                      "Deseja abrir uma nova mesa ?.",
                      style: TextStyle(fontSize: 15),
                    ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.status = !widget.status;
            });
            Navigator.pop(context);
          },
          child: Text(widget.status == true ? "Ok" : "Sim", style: TextStyle(color: Colors.white)),
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
