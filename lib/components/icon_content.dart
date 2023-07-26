import 'package:flutter/material.dart';
import '../constant.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label, this.iconColor});

  final IconData icon;
  final String label;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0, color: iconColor ?? Colors.grey),
        SizedBox(
          height: 18,
        ),
        Text(
          label,
          style: kiconLableStyle.copyWith(color:iconColor ?? Colors.grey),
        ),
      ],
    );
  }
}
