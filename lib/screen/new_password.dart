import 'package:flutter/material.dart';
import 'package:the_journey/screen/verify_email.dart';
import 'package:the_journey/variable/variable.dart';
import 'package:the_journey/screen/signup.dart';
import 'package:the_journey/home_screen/home.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
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
                padding: const EdgeInsets.only(right: 20, left: 30),
                child: Column(
                  children: [
                    firstLable(),
                    secondLable(),
                    newPassword(),
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
      margin: EdgeInsets.only(right: 185, bottom: 10),
      child: Text(
        'New Password',
        style: TextStyle(fontSize: 26),
      ),
    );
  }

  Widget secondLable() {
    return Container(
      margin: EdgeInsets.only(right: 60, bottom: 40),
      child: const Text(
        'Create aSecure and Strong New Password',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget newPassword() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: publicVerable.fillcolor,
          contentPadding: EdgeInsets.only(left: 20),
          hintText: "New Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none)),
    );
  }

  Widget conformButton() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 400,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeForm()));
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
}
