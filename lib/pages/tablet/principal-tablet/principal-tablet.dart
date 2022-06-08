import 'package:flutter/material.dart';
import 'package:gestao_pedidos/pages/tablet/garcons-content/garcons-content-tablet.dart';
import 'package:gestao_pedidos/pages/tablet/mesa-content/mesa-content-tablet.dart';
import 'package:gestao_pedidos/pages/tablet/produtos-page/produtos-content.dart';

class PrincipalTablet extends StatefulWidget {
  PrincipalTablet({Key? key}) : super(key: key);

  @override
  State<PrincipalTablet> createState() => _PrincipalTabletState();
}

int _page = 0;

class _PrincipalTabletState extends State<PrincipalTablet> {
  final _pageController = PageController(initialPage: _page);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final fullHeight = MediaQuery.of(context).size.height;
    final fullwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color.fromRGBO(0, 174, 224, 0.08),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                width: fullwidth * 0.15,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                    width: fullwidth * 0.1,
                    child: Column(
                      children: [
                        Image.asset("assets/btnCozinha.png"),
                        Divider(color: Colors.orange),
                        Column(
                          children: [
                            SizedBox(height: 18),
                            SizedBox(
                              width: fullwidth * 0.15,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 0,
                                  enableFeedback: false,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _page = 0;
                                    _pageController.animateToPage(
                                      _page,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  });
                                },
                                child: _page == 0 ? Image.asset("assets/ico-home-selected.png") : Image.asset("assets/ico-home.png"),
                              ),
                            ),
                            SizedBox(height: 18),
                            SizedBox(
                              width: fullwidth * 0.15,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 0,
                                  enableFeedback: false,
                                ),
                                onPressed: () {},
                                child: _page == 1 ? Image.asset("assets/ico-pedidos-selected.png") : Image.asset("assets/ico-pedidos.png"),
                              ),
                            ),
                            SizedBox(height: 18),
                            SizedBox(
                              width: fullwidth * 0.15,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 0,
                                  enableFeedback: false,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _page = 1;
                                    _pageController.animateToPage(
                                      _page,
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeIn,
                                    );
                                  });
                                },
                                child: _page == 1 ? Image.asset("assets/ico-produtos-selected.png") : Image.asset("assets/ico-produtos.png"),
                              ),
                            ),
                            SizedBox(height: 18),
                            SizedBox(
                              width: fullwidth * 0.15,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 0,
                                  enableFeedback: false,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _page = 2;
                                    _pageController.animateToPage(
                                      _page,
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeIn,
                                    );
                                  });
                                },
                                child: _page == 2 ? Image.asset("assets/ico-user-selected.png") : Image.asset("assets/ico-user.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        SizedBox(
                          width: fullwidth * 0.15,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              enableFeedback: false,
                            ),
                            onPressed: () {},
                            child: Image.asset("assets/ico-config.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 20),
                width: fullwidth - fullwidth * 0.15,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: fullwidth - fullwidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      MesaContentTablet(),
                      ProdutosContent(),
                      GarconsContentTablet(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
