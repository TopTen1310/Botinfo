import 'package:Botinfo/InAppPurchaseScreen.dart';
import 'package:Botinfo/PrivacyPolicyScreen.dart';
import 'package:Botinfo/TermsAndConditionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(right: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: Color(0xff1E1E1E)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            NavButtons(
                onTap: () {
                  Get.to(() => const InAppPurchaseScreen());
                },
                name: "Subscription"),
            NavButtons(
                onTap: () {
                  Get.to(() => const PrivacyPolicyScreen());
                },
                name: "Privacy & Policy"),
            NavButtons(
                onTap: () {
                  Get.to(() => const TermsAndConditionsScreen());
                },
                name: "Terms of Service"),
          ],
        ),
      ),
    );
  }
}

class NavButtons extends StatelessWidget {
  const NavButtons({super.key, required this.onTap, required this.name});
  final Function() onTap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            Container(
              // height: 19,
              // width: 19,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff006FFF)),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 11,
              ),
            )
          ],
        ),
      ),
    );
  }
}
