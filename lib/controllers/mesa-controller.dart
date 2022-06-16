import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestao_pedidos/controllers/configuracao-controller.dart';
import 'package:provider/provider.dart';

class MesaController extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  //TODO
  //Apagar todos os documentos de uma coleção
  // await db.collection("NomeLoja").doc("user.id").collection("mesas").get().then((value) {
  //  value.docs.forEach((doc) {
  //     doc.reference.delete();
  //   });
  // });
  //Outra forma de apagar todos os documentos de uma coleção
  // await db.collection("NomeLoja").doc("user.id").collection("config").doc("mesas").get().then((value) {
  //     value.reference.delete();
  //     // doc.reference.delete();
  //   });

  // if (doc.id == "mesas") {
  //  mesas.add(doc.data());
  // }

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
