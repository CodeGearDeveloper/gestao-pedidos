import 'package:flutter/material.dart';

class HomePageTablet extends StatefulWidget {
  HomePageTablet({Key? key}) : super(key: key);

  @override
  State<HomePageTablet> createState() => _HomePageTabletState();
}

class _HomePageTabletState extends State<HomePageTablet> {
  @override
  Widget build(BuildContext context) {
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: fullwidth,
        color: Color.fromRGBO(0, 174, 224, 0.08),
        child: Stack(
          children: [
            Container(
              width: fullwidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("assets/bar-tablet.png"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: fullwidth * 0.03, top: fullHeight * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: fullHeight * 0.1),
                  SizedBox(
                    height: fullHeight * 0.18,
                    width: fullwidth * 0.4,
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
                                  "COZINHA",
                                  style: TextStyle(fontSize: 36, color: Colors.white),
                                ),
                                Text(
                                  "Gestão de Pedidos",
                                  style: TextStyle(fontSize: 16, color: Colors.white),
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
                    width: fullwidth * 0.4,
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
                                  style: TextStyle(fontSize: 16, color: Colors.white),
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
