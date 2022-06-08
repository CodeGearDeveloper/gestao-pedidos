import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final controller;
  final hint;
  const TextInput({Key? key, this.controller, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white),
      onChanged: (value) {
        // do something
      },
    );
  }
}
