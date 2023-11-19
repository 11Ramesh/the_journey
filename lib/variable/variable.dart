import 'package:flutter/material.dart';

class Variable {
  bool checkEmailVaid = false;
  bool buttonActiveEmail = false;
  bool buttonActivePassword = false;
  Color backgroundColor = const Color.fromARGB(121, 255, 236, 218);
  Color buttonforeground = const Color.fromARGB(255, 255, 255, 255);
  Color buttonBackground = const Color(0xffE8B2A6);
  Color fillcolor = const Color.fromARGB(233, 255, 255, 255);
  Color signUpTextColor = const Color.fromARGB(236, 241, 120, 0);
  Color mainPageBackgroundColor = const Color.fromARGB(119, 226, 199, 171);
  Color jouneyimogiColor = const Color.fromARGB(255, 149, 121, 106);
  Color agreeColorColor = const Color.fromARGB(209, 143, 144, 137);

  void checkEmail(value) {
    checkEmailVaid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value.toString());
  }

  Widget backButton(context) {
    return Container(
      margin: EdgeInsets.only(right: 300, top: 10),
      //alignment: Alignment.centerRight,
      width: 100,
      height: 100,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/icon/backButton.png')),
    );
  }

  Widget lastlable() {
    return Row(
      children: [
        Text("I Agree to the", style: TextStyle(color: agreeColorColor)),
        TextButton(
            onPressed: () {},
            child: Text(
              "Terms of Services",
              style: TextStyle(color: signUpTextColor),
            )),
        Text("and", style: TextStyle(color: agreeColorColor)),
        TextButton(
            onPressed: () {},
            child: Text("Privacy Policy",
                style: TextStyle(color: signUpTextColor))),
      ],
    );
  }
}

class Signup {
  bool checkNickVaid = false;
  bool checkEmailVaid = false;
  bool checkBdayVaid = false;
  bool checkPasswordVaid = false;
  bool checkGenderVaid = false;
}
