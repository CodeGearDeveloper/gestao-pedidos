import 'package:flutter/material.dart';

class ButtonSimples extends StatelessWidget {
  const ButtonSimples({Key? key, this.onPressed, this.title}) : super(key: key);
  final onPressed;
  final title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(250, 90, 0, 1),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
