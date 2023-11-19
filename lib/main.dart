import 'package:flutter/material.dart';
import 'package:the_journey/login.dart';
import 'package:the_journey/variable/variable.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeForm(),
    );
  }
}

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  Variable publicVerable = Variable();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration:
              BoxDecoration(color: publicVerable.mainPageBackgroundColor),
          child: Container(
            margin: EdgeInsets.only(right: 30, left: 30),
            child: Column(
              children: [
                headText(),
                loty(),
                jouneyText(),
                docomentText(),
                openButton(),
                publicVerable.lastlable()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loty() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: LottieBuilder.asset('assets/annimation/travel.json'));
  }

  Widget headText() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Text(
        "The Journey",
        style: TextStyle(fontSize: 40, fontFamily: 'NotoSans Semibold'),
      ),
    );
  }

  Widget jouneyText() {
    return Container(
        child: Row(
      children: [
        Container(width: 25, child: Image.asset('assets/icon/imoji.png')),
        Text(
          " The Journey",
          style: TextStyle(fontSize: 17, color: publicVerable.jouneyimogiColor),
        )
      ],
    ));
  }

  Widget docomentText() {
    return Column(
      children: [
        Text(
          "Document your life, reflect on your journey",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        // Text("journey",
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget openButton() {
    return Container(
      margin: EdgeInsets.only(top: 125, bottom: 5),
      width: 400,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginForm()));
        },
        child: const Text("Get Started"),
        style: ElevatedButton.styleFrom(
            foregroundColor: publicVerable.buttonforeground,
            backgroundColor: publicVerable.buttonBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
