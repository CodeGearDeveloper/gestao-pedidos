import 'package:flutter/material.dart';

class WidgetText extends StatefulWidget {
  final String title;
  final String subtitle;
  WidgetText({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<WidgetText> createState() => _WidgetTextState();
}

class _WidgetTextState extends State<WidgetText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: TextStyle(fontSize: 18)),
          Text("${widget.subtitle}", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
