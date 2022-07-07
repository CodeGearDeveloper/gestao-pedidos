import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(0, 174, 224, 0.08),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/bar.png"),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: fullHeight * 0.1),
                  SizedBox(
                    height: fullHeight * 0.18,
                    width: fullwidth * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(250, 90, 0, 1),
                        elevation: 5,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/btnCozinha.png"),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Gerencia",
                                  style: TextStyle(fontSize: 36, color: Colors.white),
                                ),
                                Text(
                                  "Gestão do seu restaurante",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: fullHeight * 0.18,
                    width: fullwidth * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(250, 90, 0, 1),
                        elevation: 5,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/btnGarcom.png"),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "GARÇOM",
                                  style: TextStyle(fontSize: 36, color: Colors.white),
                                ),
                                Text(
                                  "Atendimento",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
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
