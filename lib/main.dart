// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io';
import 'package:Botinfo/chat_screen2.dart';
import 'package:Botinfo/constants.dart';
import 'package:Botinfo/in.dart';
import 'package:app_review/app_review.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import 'chat_screen.dart';
import 'inapppurchases.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  if (!kIsWeb) _setTargetPlatformForDesktop();

  return runApp(MyApp());
}

void _setTargetPlatformForDesktop() {
  TargetPlatform? targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _appId = '';

  @override
  void initState() {
    super.initState();
    AppReview.getAppID.then(log);

    _getAppId();
  }

  Future<void> _getAppId() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appId = packageInfo.packageName;
    });
  }

  String appID = "";

  String output = "";
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
                      print("*************APPPID****${_appId}");

                      Get.to(ChatScreen());

                      // Get.to(InAppPurchases());
                      // Get.to(ChatScreen2());
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
                    height: 50.0,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print("*****${AppReview.requestReview.then(log)}");
                  //     print("**l***${log}");
                  //     print("**a***${appID}");
                  //     print("**o***${output}");
                  //
                  //     if (output == "Success: true") {
                  //       AppReview.storeListing.then(log);
                  //
                  //       print("(****)");
                  //     } else {
                  //       AppReview.requestReview.then(log);
                  //     }
                  //   },
                  //   child: Container(
                  //       child: Text('RATE US',
                  //           style: TextStyle(
                  //             fontSize: 15.0,
                  //             fontFamily: 'Poppins',
                  //             color: Colors.white,
                  //           ))),
                  // ),
                  SizedBox(
                    height: 50.0,
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

  void log(String? message) {
    if (message != null) {
      setState(() {
        output = message;
      });
      print(message);
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
