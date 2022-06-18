import 'package:flutter/material.dart';

import 'package:gestao_pedidos/controllers/mesa-controller.dart';
import 'package:gestao_pedidos/pages/tablet/configuracoes-page/widgets/widget-text.dart';
import 'package:provider/provider.dart';

import '../../../controllers/configuracao-controller.dart';

var imgURL = "assets/images/logo.png";

class ConfiguracaoPageTablet extends StatefulWidget {
  ConfiguracaoPageTablet({Key? key}) : super(key: key);

  @override
  State<ConfiguracaoPageTablet> createState() => _ConfiguracaoPageTabletState();
}

class _ConfiguracaoPageTabletState extends State<ConfiguracaoPageTablet> {
  var dadosPessoais;
  bool edtField = true;
  // int _radioValue = 1;
  bool configMesas = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController docController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController quantidadeMesasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 35 / 2),
          Row(
            children: [
              Text(
                "Configurações",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 35 / 2),
          Divider(color: Colors.orange),
          SizedBox(height: 12),
          Expanded(child: Consumer<ConfiguracaoController>(
            builder: (context, controller, child) {
              return Container(
                child: ListView(
                  children: [
                    //Informações Gerais
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Informações Gerais",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (configMesas == false) {
                              setState(() {
                                configMesas = !configMesas;
                                quantidadeMesasController.text = controller.quantidadeMesas.toString();
                              });
                            } else {
                              //TODO
                              if (context.read<ConfiguracaoController>().mesaOcupada) {
                                setState(() {
                                  configMesas = !configMesas;
                                });
                                final snackBar = SnackBar(
                                  content: Text('Você ainda possui mesas em aberto!'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else {
                                setState(() {
                                  configMesas = !configMesas;
                                });
                                await context.read<MesaController>().criarMesas(
                                      numeroMesas: int.parse(quantidadeMesasController.text),
                                    );
                                controller.getConfig(config: "mesas");
                                final snackBar = SnackBar(
                                  content: Text('Quantidade de mesas alterada com sucesso!'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            }
                          },
                          icon: configMesas ? Icon(Icons.check) : Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Divider(color: Colors.orange),
                          SizedBox(height: 18),
                          configMesas
                              ? Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Numero de mesas", style: TextStyle(fontSize: 18)),
                                      Container(
                                        width: fullwidth * 0.05,
                                        child: TextField(
                                          controller: quantidadeMesasController,
                                          onTap: () => quantidadeMesasController.selection = TextSelection(
                                            baseOffset: 0,
                                            extentOffset: quantidadeMesasController.value.text.length,
                                          ),
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          onSubmitted: (value) async {
                                            quantidadeMesasController.text = value;
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(child: Consumer<ConfiguracaoController>(
                                  builder: (context, controller, child) {
                                    return WidgetText(title: "Numero de Mesas", subtitle: "${controller.quantidadeMesas}");
                                  },
                                )),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                    //Informações Básicas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Informações Basicas",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Divider(color: Colors.orange),
                          SizedBox(height: 18),
                          WidgetText(title: "Razão Social", subtitle: "${controller.razaoSocial}"),
                          SizedBox(height: 12),
                          WidgetText(title: "Nome Fantasia", subtitle: controller.nomeFantasia),
                          SizedBox(height: 12),
                          WidgetText(title: "CNPJ", subtitle: controller.cnpj),
                          SizedBox(height: 12),
                          WidgetText(title: "Inscrição Estadual", subtitle: controller.inscricaoEstadual),
                          SizedBox(height: 12),
                          WidgetText(title: "Inscrição Municipal", subtitle: controller.inscricaoMunicipal),
                          SizedBox(height: 12),
                          WidgetText(title: "Telefone", subtitle: controller.telefone),
                          SizedBox(height: 12),
                          WidgetText(title: "Celular", subtitle: controller.celular),
                          SizedBox(height: 12),
                          WidgetText(title: "Email", subtitle: controller.email),
                          SizedBox(height: 12),
                          TextButton(onPressed: () {}, child: Text("Editar Campos", style: TextStyle(fontSize: 16, color: Colors.orange))),
                        ],
                      ),
                    ),
                    //Informações de Endereço
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Endereço",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Divider(color: Colors.orange),
                          SizedBox(height: 18),
                          WidgetText(title: "CEP", subtitle: controller.cep),
                          SizedBox(height: 12),
                          WidgetText(title: "Logradouro", subtitle: controller.logradouro),
                          SizedBox(height: 12),
                          WidgetText(title: "Tipo do Logradouro", subtitle: controller.tipoLogradouro),
                          SizedBox(height: 12),
                          WidgetText(title: "Numero", subtitle: controller.numero),
                          SizedBox(height: 12),
                          WidgetText(title: "Complemento", subtitle: controller.complemento),
                          SizedBox(height: 12),
                          WidgetText(title: "Bairro", subtitle: controller.bairro),
                          SizedBox(height: 12),
                          WidgetText(title: "Estado", subtitle: controller.estado),
                          SizedBox(height: 12),
                          WidgetText(title: "Cidade", subtitle: controller.cidade),
                          SizedBox(height: 12),
                          TextButton(onPressed: () {}, child: Text("Editar Campos", style: TextStyle(fontSize: 16, color: Colors.orange))),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
