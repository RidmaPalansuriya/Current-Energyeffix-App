import 'package:flutter/material.dart';
import '../GetStarted.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        onStepContinue: () {
          setState(() {
            if (_currentStep < getSteps().length - 1) {
              _currentStep += 1;
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Registration Completed'),
                    content: Text('Thank you for registering!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the AlertDialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GetStartedScreen()),
                          );
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            }
          });
        },
        steps: getSteps(),
        currentStep: _currentStep,
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        isActive: _currentStep >= 0,
        title: Text('Step 1'),
        content: Column(
          children: [
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          ],
        ),
      ),
      Step(
        isActive: _currentStep >= 1,
        title: Text('Step 2'),
        content: Container(),
      ),
      Step(
        isActive: _currentStep >= 2,
        title: Text('Step 3'),
        content: Container(),
      ),
    ];
  }
}
