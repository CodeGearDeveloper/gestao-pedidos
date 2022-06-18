import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ConfiguracaoController extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  int quantidadeMesas = 0;
  late Map<String, dynamic>? mesa = {};
  var razaoSocial = "";
  var nomeFantasia = "";
  var cnpj = "";
  var inscricaoEstadual = "";
  var inscricaoMunicipal = "";
  var telefone = "";
  var email = "";
  var celular = "";
  var cep = "";
  var logradouro = "";
  var numero = "";
  var complemento = "";
  var bairro = "";
  var cidade = "";
  var estado = "";
  var tipoLogradouro = "";
  bool mesaOcupada = false;

  Future mesaListen() async {
    final docRef = await db.collection("NomeLoja").doc("user.id").collection("config").doc("mesas");
    docRef.snapshots().listen(
      (event) async {
        mesa = await event.data();
        quantidadeMesas = mesa!.length;
        for (var i = 0; i <= mesa!.length; i++) {
          try {
            if (mesa!["${i + 1}"]["status"]) {
              mesaOcupada = true;
              i = mesa!.length;
            } else {
              throw new Exception('');
            }
          } catch (e) {
            mesaOcupada = false;
          }
        }
        notifyListeners();
      },
      onError: (error) {},
    );
  }

  getConfig({config}) async {
    if (config == "mesas") {
      await db.collection("NomeLoja").doc("user.id").collection("config").get().then((event) {
        event.docs.forEach((doc) {
          if (doc.id == "mesas") {
            quantidadeMesas = doc.data().length;
          }
        });
      });
    } else if (config == "gerais") {
      await db.collection("NomeLoja").doc("user.id").collection("config").get().then((event) {
        event.docs.forEach((doc) {
          if (doc.id == "infoGerais") {
            razaoSocial = doc.data()["razaoSocial"];
            nomeFantasia = doc.data()["nomeFantasia"];
            cnpj = doc.data()["cnpj"];
            inscricaoEstadual = doc.data()["inscriEstadual"];
            inscricaoMunicipal = doc.data()["inscriMunicipal"];
            telefone = doc.data()["telefone"];
            email = doc.data()["email"];
            celular = doc.data()["celular"];
          }
        });
      });
    } else if (config == "local") {
      await db.collection("NomeLoja").doc("user.id").collection("config").get().then((event) {
        event.docs.forEach((doc) {
          if (doc.id == "local") {
            cep = doc.data()["cep"];
            logradouro = doc.data()["logradouro"];
            numero = doc.data()["numero"];
            complemento = doc.data()["complemento"];
            bairro = doc.data()["bairro"];
            cidade = doc.data()["cidade"];
            estado = doc.data()["estado"];
            tipoLogradouro = doc.data()["tipoLogradouro"];
          }
        });
      });
    } else if (config == "all") {
      await db.collection("NomeLoja").doc("user.id").collection("config").get().then((event) {
        event.docs.forEach((doc) {
          event.docs.forEach((doc) {
            if (doc.id == "mesas") {
              quantidadeMesas = doc.data().length;
              mesa = doc.data();
            }
          });
          event.docs.forEach((doc) {
            if (doc.id == "infoGerais") {
              razaoSocial = doc.data()["razaoSocial"];
              nomeFantasia = doc.data()["nomeFantasia"];
              cnpj = doc.data()["cnpj"];
              inscricaoEstadual = doc.data()["inscriEstadual"];
              inscricaoMunicipal = doc.data()["inscriMunicipal"];
              telefone = doc.data()["telefone"];
              email = doc.data()["email"];
              celular = doc.data()["celular"];
            }
          });
          if (doc.id == "local") {
            cep = doc.data()["cep"];
            logradouro = doc.data()["logradouro"];
            numero = doc.data()["numero"];
            complemento = doc.data()["complemento"];
            bairro = doc.data()["bairro"];
            cidade = doc.data()["cidade"];
            estado = doc.data()["estado"];
            tipoLogradouro = doc.data()["tipoLogradouro"];
          }
        });
      });
    }
    notifyListeners();
  }

  Future setConfig({data, config}) async {
    this.quantidadeMesas = data["quantidadeMesas"];
    db.collection("NomeLoja").doc("user.id").collection("config").doc(config).set(data);
    notifyListeners();
  }
}
