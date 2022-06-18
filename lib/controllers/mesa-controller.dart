import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_pedidos/controllers/configuracao-controller.dart';

class MesaController extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  ConfiguracaoController configController = ConfiguracaoController();

  Future statusMesa({required bool statusAtual, required int nMesa}) async {
    await db.collection("NomeLoja").doc("user.id").collection("config").doc("mesas").update({
      "${nMesa}": {"status": statusAtual}
    });
    notifyListeners();
  }

  Future criarMesas({required int numeroMesas}) async {
    await db.collection("NomeLoja").doc("user.id").collection("config").doc("mesas").get().then((value) {
      value.reference.delete();
    });
    for (var i = 1; i <= numeroMesas; i++) {
      await db.collection("NomeLoja").doc("user.id").collection("config").doc("mesas").set(
        {
          i.toString(): {"status": false}
        },
        SetOptions(merge: true),
      );
    }
    notifyListeners();
  }
}
