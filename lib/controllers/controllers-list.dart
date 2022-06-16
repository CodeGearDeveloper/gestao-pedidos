import 'package:gestao_pedidos/controllers/configuracao-controller.dart';
import 'package:provider/provider.dart';

import 'mesa-controller.dart';

final controllerList = [
  ChangeNotifierProvider<ConfiguracaoController>(
    create: (context) => ConfiguracaoController(),
  ),
  ChangeNotifierProvider<MesaController>(
    create: (context) => MesaController(),
  ),
];
