import 'package:flutter/material.dart';
import 'package:the_journey/variable/variable.dart';
import 'package:the_journey/screen/signup.dart';
import 'package:the_journey/screen/signup_email.dart';
import 'package:http/http.dart' as http;
import 'package:the_journey/screen/foget_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Variable publicVerable = Variable();
  final _loginKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: publicVerable.backgroundColor,
          ),
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                loginImage(),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 50),
                  child: Column(
                    children: [
                      lableFirst(),
                      lableSecond(),
                      userEmailField(),
                      userPasswordField(),
                      fogetPassword(),
                      openButton(),
                      signUpButton(),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 50),
                    child: publicVerable.lastlable())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      margin: EdgeInsets.only(left: 60, bottom: 25),
      child: Row(
        children: [
          const Text("Don't Have an account ?"),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpEmailForm()));
              },
              child: Text(
                "Signup",
                style: TextStyle(color: publicVerable.signUpTextColor),
              ))
        ],
      ),
    );
  }

  Widget lableFirst() {
    return Container(
      margin: const EdgeInsets.only(right: 123, bottom: 5),
      child: const Text(
        "Login your Journey",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 23,
          color: Color.fromARGB(195, 149, 121, 106),
        ),
      ),
    );
  }

  Widget lableSecond() {
    return Text(
      "Access Your Account and Securely Connect",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(144, 1, 1, 1)),
    );
  }

  Widget userEmailField() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            filled: true,
            fillColor: publicVerable.fillcolor,
            hintText: "Email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
        controller: email,
        onChanged: (value) {
          setState(() {
            if (value.toString().isNotEmpty) {
              publicVerable.buttonActiveEmail = true;
            } else {
              publicVerable.buttonActiveEmail = false;
            }
          });
        },
        validator: (value) {
          publicVerable.checkEmail(value);
          if (!(publicVerable.checkEmailVaid)) {
            return "Invalid Email address";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget userPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        filled: true,
        fillColor: publicVerable.fillcolor,
        hintText: "Password",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      onChanged: (value) {
        setState(() {
          if (value.toString().isNotEmpty) {
            publicVerable.buttonActivePassword = true;
          } else {
            publicVerable.buttonActivePassword = false;
          }
        });
      },
      validator: (value) {
        if (value.toString().length >= 8) {
          return null;
        } else {
          return "Password lenth must be gretter than 8";
        }
      },
    );
  }

  Widget fogetPassword() {
    return Container(
        margin: EdgeInsets.only(left: 188),
        child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FogetPasswordForm()));
            },
            child: Text(
              "Forget Password ?",
              style: TextStyle(color: publicVerable.buttonBackground),
            )));
  }

  Widget openButton() {
    return Container(
      width: 400,
      height: 45,
      child: ElevatedButton(
        onPressed: publicVerable.buttonActiveEmail &&
                publicVerable.buttonActivePassword
            ? () {
                if (_loginKey.currentState!.validate()) {}
              }
            : null,
        child: const Text("Open"),
        style: ElevatedButton.styleFrom(
            foregroundColor: publicVerable.buttonforeground,
            backgroundColor: publicVerable.buttonBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }

  Widget loginImage() {
    return Container(
        width: 350,
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        child: Image.asset(
          'assets/image/login.png',
        ));
  }
}
