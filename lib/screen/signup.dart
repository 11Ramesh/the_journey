import 'package:flutter/material.dart';
import 'package:the_journey/variable/variable.dart';
import 'package:the_journey/login.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupState();
}

class _SignupState extends State<SignupForm> {
  Variable publicVerable = Variable();
  Signup signup = Signup();
  DateTime date = DateTime.now();
  TextEditingController bday = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController nname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final _signupKey = GlobalKey<FormState>();
  bool sameNameCheck = false;
  bool openButtonActive = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: publicVerable.backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              publicVerable.backButton(context),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Form(
                  key: _signupKey,
                  child: Column(
                    children: [
                      lableFirst(),
                      userFname(),
                      userLname(),
                      userNname(),
                      userEmail(),
                      userpassword(),
                      Row(
                        children: [
                          userBday(),
                          userGender(),
                        ],
                      ),
                      openButton(),
                      login(),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: publicVerable.lastlable())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lableFirst() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 170),
          child: Text(
            "Signup Journey",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(right: 125),
            child: Text("Create Your Acount and Get Started"))
      ],
    );
  }

  Widget userFname() {
    return Container(
      margin: EdgeInsets.only(bottom: 15, top: 20),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(left: 20),
            hintText: "First Name*",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none)),
        controller: fname,
      ),
    );
  }

  Widget userLname() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(
              left: 20,
            ),
            hintText: "Last Name*",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none)),
        controller: lname,
      ),
    );
  }

  Widget userNname() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(left: 20, bottom: 10),
            hintText: "Nick Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none)),
        controller: nname,
        onChanged: (value) {
          setState(() {
            if (value.toString().isNotEmpty) {
              signup.checkNickVaid = true;
            } else {
              signup.checkNickVaid = false;
            }
            openbuttonactive();
          });
        },
      ),
    );
  }

  Widget userEmail() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(left: 20, bottom: 10),
            hintText: "Email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none)),
        controller: _email,
        onChanged: (value) {
          setState(() {
            if (value.toString().isNotEmpty) {
              signup.checkEmailVaid = true;
            } else {
              signup.checkEmailVaid = false;
            }
            openbuttonactive();
          });
        },
        validator: (value) {
          publicVerable.checkEmail(value);
          if (!(publicVerable.checkEmailVaid)) {
            signup.checkEmailVaid = true;
            return "Invalid Email address";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget userpassword() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(left: 20),
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none)),
        validator: (value) {
          if (value.toString().length <= 8) {
            return "Pastword must be Gretter than 8";
          } else {
            return null;
          }
        },
        controller: _password,
        onChanged: (value) {
          setState(() {
            if (value.toString().isNotEmpty) {
              signup.checkPasswordVaid = true;
            } else {
              signup.checkPasswordVaid = false;
            }
          });
          openbuttonactive();
        },
      ),
    );
  }

  Widget userGender() {
    return Container(
      width: 140,
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(left: 20, bottom: 10),
            hintText: "Gender",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            suffixIcon: IconButton(
              onPressed: () {
                _gender.clear();
              },
              icon: Icon(Icons.cancel_sharp),
            )),
        controller: _gender,
        onChanged: (value) {
          setState(() {
            if (value.toString().isNotEmpty) {
              signup.checkGenderVaid = true;
            } else {
              signup.checkGenderVaid = false;
            }
            openbuttonactive();
          });
        },
      ),
    );
  }

  Widget userBday() {
    return Container(
      margin: EdgeInsets.only(right: 30),
      width: 180,
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: publicVerable.fillcolor,
            contentPadding: EdgeInsets.only(left: 20, bottom: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            hintText: "Bday",
            prefixIcon: IconButton(
                onPressed: () {
                  getDate();
                },
                icon: const Icon(Icons.calendar_month_sharp)),
            suffixIcon: IconButton(
              onPressed: () {
                bday.clear();
              },
              icon: Icon(Icons.cancel_sharp),
            )),
        controller: bday,
        onChanged: (value) {
          setState(() {
            if (value.toString().isNotEmpty) {
              signup.checkBdayVaid = true;
            } else {
              signup.checkBdayVaid = false;
            }
            openbuttonactive();
          });
        },
      ),
    );
  }

  Widget openButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 400,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: publicVerable.buttonforeground,
              backgroundColor: publicVerable.buttonBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: openButtonActive
              ? () {
                  if (_signupKey.currentState!.validate()) {
                    namesCompare();
                  }
                }
              : null,
          child: const Text("Sign up")),
    );
  }

  Widget login() {
    return Container(
      margin: EdgeInsets.only(left: 80),
      child: Row(
        children: [
          const Text("Already Have An Accoun?"),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginForm()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: publicVerable.signUpTextColor,
                ),
              ))
        ],
      ),
    );
  }

  void getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));
    if (date != null) {
      setState(() {
        signup.checkBdayVaid = true;
        openbuttonactive();
        bday.text = date.toString().split(" ")[0];
      });
    }
  }

  void namesCompare() {
    if (fname.text == lname.text) {
      const snackBar = SnackBar(
          content: Center(
              child: Text(
                  'Can not t use same name for First Name and Last name')));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (fname.text == nname.text) {
      const snackBar = SnackBar(
          content: Center(
              child:
                  Text('Cann not use same name for First Name and Nick name')));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (lname.text == nname.text) {
      const snackBar = SnackBar(
          content: Center(
              child:
                  Text('Cann not use same name for Last Name and Nick name')));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void openbuttonactive() {
    if (signup.checkNickVaid &&
        signup.checkEmailVaid &&
        signup.checkPasswordVaid &&
        signup.checkBdayVaid &&
        signup.checkGenderVaid) {
      openButtonActive = true;
    } else {
      openButtonActive = false;
    }
  }
}
