import 'package:flutter/material.dart';
import 'package:gestao_pedidos/widget/button-simples/button-simples.dart';
import 'package:gestao_pedidos/widget/text-input/text-input.dart';

class LoginGarcom extends StatefulWidget {
  LoginGarcom({Key? key}) : super(key: key);

  @override
  State<LoginGarcom> createState() => _LoginGarcomState();
}

class _LoginGarcomState extends State<LoginGarcom> {
  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromRGBO(0, 174, 224, 0.08),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/loginIlustrator.png"),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: fullHeight * 0.2),
                  Text(
                    "Fazer Login",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: fullHeight * 0.05),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: TextInput(
                        hint: "E-mail",
                      )),
                  SizedBox(height: fullHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextInput(
                      hint: "Senha",
                    ),
                  ),
                  SizedBox(height: fullHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: fullwidth,
                      child: ButtonSimples(
                        onPressed: () {},
                        title: "Entrar",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
