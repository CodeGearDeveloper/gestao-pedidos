import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_pedidos/auth/auth.dart';

class GarcomController extends ChangeNotifier {
  AuthService _authService = AuthService();
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<void> novoGarcom({required String email, required String senha, required String nome}) async {
    await _authService.registrar(email, senha).then((value) async {
      await db.collection("NomeLoja").doc("user.id").collection("garcons").doc().set(
        {
          "nomeGarcom": nome,
          "email": email,
          "validado": false,
        },
        SetOptions(merge: true),
      );
    });
    notifyListeners();
  }
}
