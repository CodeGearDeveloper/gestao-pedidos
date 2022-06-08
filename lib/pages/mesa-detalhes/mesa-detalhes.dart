import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestao_pedidos/widget/button-simples/button-simples.dart';

class MesaDetalhes extends StatefulWidget {
  MesaDetalhes({Key? key}) : super(key: key);

  @override
  State<MesaDetalhes> createState() => _MesaDetalhesState();
}

class _MesaDetalhesState extends State<MesaDetalhes> {
  late var comanda = [];
  late var pedidos = [];
  Firestore reference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mesa 01",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Detalhes da Mesa"),
                ],
              ),
            ),
            Divider(color: Colors.orange),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Data da abertura:"),
                  Text("04/06/2022"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hora da abertura:"),
                  Text("22:45"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cliente:"),
                  Text("Opcional"),
                ],
              ),
            ),
            Divider(color: Colors.orange),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Comanda"),
                Divider(color: Colors.orange),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: fullwidth,
                child: ButtonSimples(
                  onPressed: () {
                    setState(() {
                      comanda.add({
                        "quantidade": 2,
                        "item": "Cerveja Litrão",
                        "valor": 7.59,
                      });
                    });
                  },
                  //TODO
                  //Puxa os produtos que ja estão prontos
                  title: "Novo item",
                ),
              ),
            ),
            Container(
              height: comanda.length < 5 ? null : 150 - 13,
              child: comanda.length == 0
                  ? Center(child: Text("Comanda vazia"))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: comanda.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Qt: ${comanda[index]['quantidade']}"),
                              Text("${comanda[index]['item']}"),
                              Text("R\$${comanda[index]['valor']}"),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Divider(color: Colors.orange),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pedidos"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: fullwidth,
                child: ButtonSimples(
                  onPressed: () async {
                    setState(() {
                      pedidos.add({
                        "mesa": 01,
                        "quantidade": 1,
                        "obs": "Sem Camarão",
                        "cliente": "opcional",
                        "garcom": "Garçom 01",
                        "status": 1,
                        "pedidos": [
                          {
                            "pedido": "Caldo de Camarão",
                          }
                        ]
                      });
                      comanda.add({
                        "quantidade": 1,
                        "item": "Caldo de Camarão",
                        "valor": 15.01,
                      });
                    });
                    // final ref = await reference.collection("OlaMundo").add({
                    //   "quantidade": 1,
                    //   "item": "Caldo de Camarão",
                    //   "valor": 15.01,
                    // });
                  },
                  //TODO
                  //Puxa os produtos que irão ser feitos
                  //O item sera colocado nessa lista e adicionado a comanda
                  //porem somente a comanda tera o valor contabilizado
                  title: "Novo Pedido",
                ),
              ),
            ),
            Container(
              height: pedidos.length < 3 ? null : 200,
              child: pedidos.length == 0
                  ? Center(child: Text("Nenhum pedido em Andamento"))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: pedidos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Pedido: "),
                                    Text("${pedidos[index]['pedidos'][0]['pedido']}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Obs: "),
                                    Text("${pedidos[index]['obs']}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3, bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("status: "),
                                    pedidos[index]['status'] != 0
                                        ? Row(
                                            children: [
                                              Text("Pedido Pronto"),
                                              Image.asset("assets/mesaDisponivel.png"),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Text("Pedido em Produção"),
                                              Image.asset("assets/mesaOcupada.png"),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: fullwidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonSimples(
            onPressed: () {},
            title: "Fechar Mesa",
          ),
        ),
      ),
    );
  }
}
