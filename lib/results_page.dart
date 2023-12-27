import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_button.dart';
import 'reusable_card.dart';
import 'constants.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding:EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )
          ),
          
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColour,
              cardChild: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Text(
                  'Normal',
                  style: kResultTextStyle,
                ),
                Text(
                  '18.3',
                  style: kBMITextStyle,
                ),
                Text(
                  'Hello',
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                )
               ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}