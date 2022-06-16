import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProdutoItemTablet extends StatefulWidget {
  final String nomeProduto;
  final String descricaoProduto;
  final String precoProduto;
  late bool tipoProduto;

  late bool statusProduto;

  ProdutoItemTablet({
    Key? key,
    required this.nomeProduto,
    required this.descricaoProduto,
    required this.precoProduto,
    required this.tipoProduto,
    required this.statusProduto,
  }) : super(key: key);

  @override
  State<ProdutoItemTablet> createState() => _ProdutoItemTabletState();
}

class _ProdutoItemTabletState extends State<ProdutoItemTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Produto:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("${widget.nomeProduto}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Descrição:", style: TextStyle(fontSize: 14)),
              Text("${widget.descricaoProduto}", style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Valor:", style: TextStyle(fontSize: 14)),
              Text("R\$${widget.precoProduto}", style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pedido de produção:", style: TextStyle(fontSize: 14)),
              widget.tipoProduto ? Text("COZINHA", style: TextStyle(fontSize: 14)) : Text("COMUM", style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Produto disponivel:", style: TextStyle(fontSize: 14)),
              Switch(
                value: widget.statusProduto,
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
          Divider(color: Colors.orange),
        ],
      ),
    );
  }

  alertFecharMesa(
    BuildContext context,
  ) {
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(widget.statusProduto == false ? "Ativar Produto ?" : "Desativar Produto ?", style: TextStyle(fontSize: 20)),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              widget.statusProduto == true
                  ? Text(
                      "Ao desativar um produto, o mesmo deixara de aparecer na lista de produtos disponiveis para serem pedidos.",
                      style: TextStyle(fontSize: 15),
                    )
                  : Text(
                      "Ao ativar um produto, o mesmo passara a aparecer na lista de produtos disponiveis para serem pedidos.",
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
              widget.statusProduto = !widget.statusProduto;
            });
            Navigator.pop(context);
          },
          child: Text(widget.statusProduto == true ? "Ok" : "Sim", style: TextStyle(color: Colors.white)),
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
