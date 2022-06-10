import 'package:flutter/material.dart';

import '../../../widget/button-simples/button-simples.dart';
import '../../../widget/tablet/produto-item-tablet/produto-item-tablet.dart';

class ProdutosContent extends StatefulWidget {
  const ProdutosContent({Key? key}) : super(key: key);

  @override
  State<ProdutosContent> createState() => _ProdutosContentState();
}

bool tipoProduto = false;

var _produtos = [
  {
    "nomeProduto": "Refrigerante",
    "descricaoProduto": "Refrigerante de 2 litros",
    "precoProduto": "R\$ 3,00",
    "tipoProduto": false,
    "statusProduto": true,
  },
  {
    "nomeProduto": "Coxinha de Frango",
    "descricaoProduto": "Com Requeijão",
    "precoProduto": "R\$ 12,00",
    "tipoProduto": true,
    "statusProduto": true,
  },
  {
    "nomeProduto": "Coxinha de Frango",
    "descricaoProduto": "Tradicional",
    "precoProduto": "R\$ 12,00",
    "tipoProduto": true,
    "statusProduto": true,
  },
  {
    "nomeProduto": "Pizza",
    "descricaoProduto": "Pizza de queijo",
    "precoProduto": "R\$ 12,00",
    "tipoProduto": true,
    "statusProduto": false,
  },
];

bool mostrarBuscar = false;
TextEditingController nomeProdutoController = TextEditingController();
TextEditingController descricaoProdutoController = TextEditingController();
TextEditingController valorProdutoController = TextEditingController();
TextEditingController categoriaProdutoController = TextEditingController();

class _ProdutosContentState extends State<ProdutosContent> {
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
              "Produtos",
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
              itemCount: _produtos.length,
              itemBuilder: (BuildContext context, int i) {
                return ProdutoItemTablet(
                  tipoProduto: _produtos[i]["tipoProduto"] as bool,
                  descricaoProduto: _produtos[i]["descricaoProduto"].toString(),
                  nomeProduto: _produtos[i]["nomeProduto"].toString(),
                  precoProduto: _produtos[i]["precoProduto"].toString(),
                  statusProduto: _produtos[i]["statusProduto"] as bool,
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: fullwidth,
          child: ButtonSimples(
            title: "Cadastrar novo produto",
            onPressed: () {
              alertCadProduto(context);
            },
          ),
        ),
      ],
    );
  }

  alertCadProduto(BuildContext context) {
    //configura o AlertDialog
    AlertDialog(
      title: Text("Novo Produto", style: TextStyle(fontSize: 20)),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeProdutoController,
                decoration: InputDecoration(
                  hintText: 'Nome do produto',
                ),
              ),
              TextField(
                controller: descricaoProdutoController,
                decoration: InputDecoration(
                  hintText: 'Descrição',
                ),
              ),
              TextField(
                controller: valorProdutoController,
                decoration: InputDecoration(
                  hintText: 'Valor',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tipo:", style: TextStyle(fontSize: 14)),
                  Switch(
                    value: tipoProduto,
                    onChanged: (value) {
                      setState(() {
                        tipoProduto = !tipoProduto;
                        print(tipoProduto);
                      });
                      activeTrackColor:
                      Colors.red;
                      activeColor:
                      Colors.orange;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            var produto = {
              "nomeProduto": nomeProdutoController.text,
              "descricaoProduto": descricaoProdutoController.text,
              "precoProduto": valorProdutoController.text,
              "tipoProduto": tipoProduto,
              "statusProduto": true,
            };
            setState(() {
              _produtos.add(produto);
            });
            nomeProdutoController.clear();
            descricaoProdutoController.clear();
            valorProdutoController.clear();
            categoriaProdutoController.clear();
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
        return AlertDialog(
          title: Text("Novo Produto", style: TextStyle(fontSize: 20)),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nomeProdutoController,
                        decoration: InputDecoration(
                          hintText: 'Nome do produto',
                        ),
                      ),
                      TextField(
                        controller: descricaoProdutoController,
                        decoration: InputDecoration(
                          hintText: 'Descrição',
                        ),
                      ),
                      TextField(
                        controller: valorProdutoController,
                        decoration: InputDecoration(
                          hintText: 'Valor',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vai pra Cozinha ?", style: TextStyle(fontSize: 14)),
                          Switch(
                            value: tipoProduto,
                            onChanged: (value) {
                              setState(() {
                                tipoProduto = !tipoProduto;
                                print(tipoProduto);
                              });
                              activeTrackColor:
                              Colors.red;
                              activeColor:
                              Colors.orange;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                var produto = {
                  "nomeProduto": nomeProdutoController.text,
                  "descricaoProduto": descricaoProdutoController.text,
                  "precoProduto": valorProdutoController.text,
                  "tipoProduto": tipoProduto,
                  "statusProduto": true,
                };
                setState(() {
                  _produtos.add(produto);
                });
                nomeProdutoController.clear();
                descricaoProdutoController.clear();
                valorProdutoController.clear();
                categoriaProdutoController.clear();
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
      },
    );
  }
}
