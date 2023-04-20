import 'package:Botinfo/Constants/PrivacyPolicyText.dart';
import 'package:Botinfo/Controllers/TermsAndConditionController.dart';
import 'package:Botinfo/TermsAndConditionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends GetView<TermsAndConditionController> {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
            padding: EdgeInsets.zero,
          ),
          title: const Text(
            "Privacy & Policy",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                children: [
                  Text(
                    privacyPolicyText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () => Get.to(const TermsAndConditionsScreen()),
            //   child: RichText(
            //       text: const TextSpan(
            //           text: "Read",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400),
            //           children: [
            //         TextSpan(
            //           text: " Privacy Policy",
            //           style: TextStyle(
            //               color: Color(0xff006FFF),
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400),
            //         )
            //       ])),
            // ),
            // const SizedBox(
            //   height: 18,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     controller.agreePrivacy.value = true;
            //     Get.to(() => const TermsAndConditionsScreen());
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.symmetric(horizontal: 20),
            //     width: double.infinity,
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.symmetric(vertical: 14),
            //     decoration: const BoxDecoration(
            //       color: Color(0xff006FFF),
            //       borderRadius: BorderRadius.all(Radius.circular(20)),
            //     ),
            //     child: const Text("I ACCEPT",
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           letterSpacing: 1.5,
            //           fontFamily: 'Roboto',
            //           fontWeight: FontWeight.w700,
            //           color: Colors.white,
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
