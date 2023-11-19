import 'package:flutter/material.dart';
import 'package:the_journey/screen/new_password.dart';
import 'package:the_journey/variable/variable.dart';
import 'package:the_journey/screen/signup.dart';

class VerifyEmailForm extends StatefulWidget {
  bool checkWhatNavigate;
  VerifyEmailForm({required this.checkWhatNavigate});

  @override
  State<VerifyEmailForm> createState() =>
      _VerifyEmailFormState(checkWhatNavigate: checkWhatNavigate);
}

class _VerifyEmailFormState extends State<VerifyEmailForm> {
  bool checkWhatNavigate;
  _VerifyEmailFormState({required this.checkWhatNavigate});
  Variable publicVerable = Variable();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: publicVerable.backgroundColor),
        child: Center(
          child: Column(
            children: [
              publicVerable.backButton(context),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  children: [
                    firstLable(),
                    secondLable(),
                    emailTextFiel(),
                    resendButton(),
                    conformButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstLable() {
    return Container(
      margin: EdgeInsets.only(right: 150, bottom: 10),
      child: Text(
        'Email verification',
        style: TextStyle(fontSize: 26),
      ),
    );
  }

  Widget secondLable() {
    return Container(
      margin: EdgeInsets.only(right: 40, bottom: 40),
      child: const Text(
        'Secure Your Accout with EmailConfirmation',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget emailTextFiel() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: publicVerable.fillcolor,
          contentPadding: EdgeInsets.only(left: 20),
          hintText: "Pin Code",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none)),
    );
  }

  Widget conformButton() {
    return Container(
      //margin: EdgeInsets.only(top: 10),
      width: 400,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      checkWhatNavigate ? NewPasswordForm() : SignupForm()));
        },
        child: Text("Confirm"),
        style: ElevatedButton.styleFrom(
            foregroundColor: publicVerable.buttonforeground,
            backgroundColor: publicVerable.buttonBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }

  Widget resendButton() {
    return Container(
      margin: EdgeInsets.only(right: 252),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "Resend Code",
            style: TextStyle(color: publicVerable.buttonBackground),
          )),
    );
  }
}
