import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegleges_wo/models/account.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate your BMI'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BMICalculatorBody(),
      backgroundColor: Colors.black,
    );
  }
}

class BMICalculatorBody extends StatefulWidget {
  @override
  _BMICalculatorBodyState createState() => _BMICalculatorBodyState();
}

class _BMICalculatorBodyState extends State<BMICalculatorBody> {
  Account account = Get.arguments["account"] as Account;
  
  double bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 37, 37),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white38),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${ account.height.toInt()==0?100:account.height.toInt()}",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Slider(
                    inactiveColor: Colors.black45,
                    activeColor: Colors.green,
                    value: account.height.toDouble()==0?100:account.height.toDouble(),
                    min: 100,
                    max: 220,
                    onChanged: (newValue) {
                      setState(() {
                        account.height = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 37, 37),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weight',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white38),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${ account.weight.toInt()==0?30:account.weight.toInt()}",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Slider(
                    inactiveColor: Colors.black45,
                    activeColor: Colors.green,
                    value: account.weight.toDouble()==0?30:account.weight.toDouble(),
                    min: 30,
                    max: 150,
                    onChanged: (newValue) {
                      setState(() {
                        account.weight = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          CupertinoButton(
            color: Colors.green,
            onPressed: () {
              calculateBMI();
            },
            child: Text('Calculate BMI'),
          ),
          SizedBox(height: 20),
      
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 37, 37, 37),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Underweight <18.5",
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 87, 143, 189)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Normal 18.6-24.9",
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 77, 226, 82)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Overwieght 25-29.9",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 224, 128, 49)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Obese 30-34.9",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 211, 54, 67)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Extreme 35<",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 255, 0, 0)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calculateBMI() {
    double heightInMeters = account.height / 100;
    double bmi = account.weight / (heightInMeters * heightInMeters);
    setState(() {
      this.bmi = bmi;
    });
  }
}
