import 'package:flutter/material.dart';
import 'package:the_journey/screen/verify_email.dart';
import 'package:the_journey/variable/variable.dart';
import 'package:the_journey/screen/signup.dart';

class FogetPasswordForm extends StatefulWidget {
  const FogetPasswordForm({super.key});

  @override
  State<FogetPasswordForm> createState() => _FogetPasswordFormState();
}

class _FogetPasswordFormState extends State<FogetPasswordForm> {
  Variable publicVerable = Variable();
  bool checkWhatNavigate = true;
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
                    emailTextFielFoget(),
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
      margin: EdgeInsets.only(right: 152, bottom: 10),
      child: Text(
        'Forgot Password',
        style: TextStyle(fontSize: 26),
      ),
    );
  }

  Widget secondLable() {
    return Container(
      margin: EdgeInsets.only(right: 60, bottom: 40),
      child: const Text(
        'Reset Your Password and Regain Access',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget emailTextFielFoget() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: publicVerable.fillcolor,
          contentPadding: EdgeInsets.only(left: 20),
          hintText: "Email",
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
                      VerifyEmailForm(checkWhatNavigate: checkWhatNavigate)));
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
      margin: EdgeInsets.only(right: 245),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "Resend Email",
            style: TextStyle(color: publicVerable.buttonBackground),
          )),
    );
  }
}
