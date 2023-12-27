import 'package:flutter/material.dart';
import 'package:flutter_application_3/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kactiveCardColour : kinactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                ),),

                Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kactiveCardColour : kinactiveCardColour, 
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                ),)
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              colour: kactiveCardColour,  
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data : const SliderThemeData(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            
          ),),

          Expanded(child: Row(
            children: <Widget>[

                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColour, 
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () { 
                                setState(() {
                                  weight--;
                                });
                               },
                              backgroundColor: Color(0xFF4C4F5E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                              ),
                              child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {  
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                              ),
                              child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        
                      ],
                    )
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColour, 
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () { 
                                setState(() {
                                  age--;
                                });
                               },
                              backgroundColor: Color(0xFF4C4F5E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                              ),
                              child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                              ),
                            ),

                            const SizedBox(
                              width: 10.0,
                            ),

                            FloatingActionButton(
                              onPressed: () {  
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                              ),
                              child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle:'Calculate', 
            onTap: (){
              
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult : calc.calculateBMI(),
                  resultText : calc.getResult(),
                  interpretation : calc.getInterpretation(),
                ),
                ),
              );
            }
          ),
        ],
      )
     
    );
  }
}






