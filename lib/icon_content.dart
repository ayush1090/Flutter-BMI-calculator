import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(height: 80.0,),
        Text(label, style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),)
      ],
    );
  }
}
