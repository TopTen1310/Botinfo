// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:Botinfo/SharedPreference.dart';
import 'package:Botinfo/chat_screen.dart';
import 'package:Botinfo/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    checkNewUser();
  }

  checkNewUser() async {
    String newUser = await SharedPreference.getStringValuesSF("newUser");
    Constant.newUser = newUser;
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  color: Colors.black,
                  child: Image.asset('assets/images/robot.png')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app-icon-black-bg.png',
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('BOTINFO',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset('assets/images/small-robot.png'),
                  SizedBox(height: 15.0),
                  RichText(
                      text: TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(fontSize: 20.0),
                          children: [
                        TextSpan(
                          text: 'BOTINFO',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 111, 255, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ', the most',
                          style: TextStyle(color: Colors.white),
                        )
                      ])),
                  RichText(
                      text: TextSpan(
                          text: 'advanced language model at',
                          style: TextStyle(fontSize: 20.0),
                          children: [
                        // TextSpan(text: 'advanced language model at your fingertips')
                      ])),
                  RichText(
                      text: TextSpan(
                          text: ' your fingertips',
                          style: TextStyle(fontSize: 20.0),
                          children: [
                        // TextSpan(text: 'advanced language model at your fingertips')
                      ])),
                  SizedBox(
                    height: 45.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ChatScreen());
                    },
                    child: Container(
                      height: 50.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(0, 111, 255, 1),
                        ),
                        color: Color.fromRGBO(0, 111, 255, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: Text(
                        'GET STARTED',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app-icon-black-bg.png',
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('BOTINFO',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ));
  }
}
