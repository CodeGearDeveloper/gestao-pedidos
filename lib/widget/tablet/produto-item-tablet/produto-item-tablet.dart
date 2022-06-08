import 'package:flutter/material.dart';

class ProdutoItemTablet extends StatefulWidget {
  ProdutoItemTablet({Key? key}) : super(key: key);

  @override
  State<ProdutoItemTablet> createState() => _ProdutoItemTabletState();
}

class _ProdutoItemTabletState extends State<ProdutoItemTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Produto:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("Piza de calabresa", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Descrição:", style: TextStyle(fontSize: 14)),
              Text("Pizza sabor calabresa - Grande", style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Valor:", style: TextStyle(fontSize: 14)),
              Text("R\$12,00", style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categorias:", style: TextStyle(fontSize: 14)),
              Text("PEDIDO, PIZZA", style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status:", style: TextStyle(fontSize: 14)),
              Text("ATIVO", style: TextStyle(fontSize: 14, color: Colors.green)),
            ],
          ),
          Divider(color: Colors.orange),
        ],
      ),
    );
  }
}
