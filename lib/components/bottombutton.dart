import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonText, required this.onTap});
  final String buttonText;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          child: Text(buttonText, style: kButtonBigStyle),
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Color(0xFFEB1555),
          ),
          width: double.infinity,
          height: kbottomContainerHeight),
    );
  }
}
