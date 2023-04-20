import 'package:Botinfo/Controllers/PurchaseController.dart';
import 'package:Botinfo/Controllers/TermsAndConditionController.dart';
import 'package:Botinfo/InAppPurchaseScreen.dart';
import 'package:Botinfo/TermsAndConditionsScreen.dart';
import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

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
          child: Stack(
            children: [
              const _Body(),
              Obx(
                () => Visibility(
                  visible: Get.find<PurchaseController>().isLoading.value,
                  child: const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.white38)),
                ),
              )
            ],
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

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          children: [
            const Spacer(),
            Image.asset('assets/images/small-robot.png'),
            const SizedBox(height: 15.0),
            RichText(
                text: const TextSpan(
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
                text: const TextSpan(
                    text: 'advanced language model at',
                    style: TextStyle(fontSize: 20.0),
                    children: [
                  // TextSpan(text: 'advanced language model at your fingertips')
                ])),
            RichText(
                text: const TextSpan(
                    text: ' your fingertips',
                    style: TextStyle(fontSize: 20.0),
                    children: [
                  // TextSpan(text: 'advanced language model at your fingertips')
                ])),
            const SizedBox(
              height: 45.0,
            ),
            GestureDetector(
              onTap: () {
                if (Get.find<TermsAndConditionController>()
                    .alreadyAgreed
                    .value) {
                  Get.to(() => const InAppPurchaseScreen());
                } else {
                  Get.to(() => const TermsAndConditionsScreen());
                }
              },
              child: Container(
                height: 50.0,
                width: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0, 111, 255, 1),
                  ),
                  color: const Color.fromRGBO(0, 111, 255, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
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
            const SizedBox(
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
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app-icon-black-bg.png',
                  height: 20.0,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text('BOTINFO',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
