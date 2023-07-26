import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.bmiInterpretation});
  final String bmiResult;
  final String resultText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                child: Text('Your Result', style: kTiltStyle),
              )),
          Expanded(
            flex: 7,
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if(resultText == '')
                  Text(resultText,
                      textAlign: TextAlign.center, style: kResultTextStyle),
                  Text(bmiResult,
                      textAlign: TextAlign.center, style: kBMITextStyle),
                  Text(bmiInterpretation,
                      textAlign: TextAlign.center, style: kBMIdescriptionStyle),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              child: Container(
                  alignment: Alignment.center,
                  child: Text('RE-CALCLULATE', style: kButtonBigStyle),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFEB1555),
                  ),
                  width: double.infinity,
                  height: kbottomContainerHeight),
            ),
          )
        ],
      ),
    ));
  }
}
