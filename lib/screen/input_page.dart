import 'package:bmi_calculator/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constant.dart';
import '../components/round_icon.dart';
import '../components/bottombutton.dart';
import '../calculator_brain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

enum Gender { male, female }

var alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  isCloseButton: false,
  isOverlayTapDismiss: true,
  descStyle: TextStyle(fontSize: 18),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 500),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle:
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
  alertAlignment: Alignment.center,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleCardSelected = false;
  bool femaleCardSelected = false;

  void updateGender(Gender selectedGender) {
    maleCardSelected =
        (selectedGender == Gender.male) ? !maleCardSelected : false;
    femaleCardSelected =
        (selectedGender == Gender.female) ? !femaleCardSelected : false;
  }

  int _height = 180;
  int _weight = 60;
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator!'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: maleCardSelected
                        ? Color(0xFF111328)
                        : Color(0xFF1D1E33),
                    cardChild: IconContent(
                      icon: Icons.male,
                      label: 'male',
                      iconColor: maleCardSelected ? Colors.white : null,
                    ),
                    onTap: () {
                      setState(() {
                        updateGender(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: femaleCardSelected
                        ? Color(0xFF111328)
                        : Color(0xFF1D1E33),
                    cardChild: IconContent(
                      icon: Icons.female,
                      label: 'female',
                      iconColor: femaleCardSelected ? Colors.white : null,
                    ),
                    onTap: () {
                      setState(() {
                        updateGender(Gender.female);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kiconLableStyle),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(_height.toString(), style: knumberStyle),
                            Text('cm', style: kcmStyle),
                          ]),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x15EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          value: _height.toDouble(),
                          min: 110,
                          max: 230,
                          onChanged: (double newValue) {
                            setState(() {
                              _height = newValue.toInt();
                            });
                          },
                          inactiveColor: Color(0xFF8D8E98),
                        ),
                      )
                    ])),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Weight', style: kiconLableStyle),
                          Text(_weight.toString(), style: knumberStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  _weight--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  _weight++;
                                });
                              }),
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age', style: kiconLableStyle),
                        Text(_age.toString(), style: knumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                _age--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                _age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonText: 'CALCLULATE',
              onTap: () {
                if (maleCardSelected == false && femaleCardSelected == false) {
                  Alert(
                          context: context,
                          style: alertStyle,
                          title: "ERROR!",
                          desc: "성별 클릭 부탁해요!")
                      .show();
                } else {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: _weight, height: _height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              bmiInterpretation: calc.getInterpretation())));
                }
              }),
        ],
      ),
    );
  }
}
