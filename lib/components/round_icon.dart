import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.iconForCircle, this.onPressedIcon);
  final IconData iconForCircle;
  Function()? onPressedIcon;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
          width: 56,
          height: 56
      ),
      shape : const CircleBorder(),
      fillColor : const Color(0xFF4C4F5E),
      child : Icon(iconForCircle, size: 20, color: Colors.white),
      onPressed : onPressedIcon,
      

    );
  }
}
