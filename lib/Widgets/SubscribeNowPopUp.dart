import 'package:Botinfo/InAppPurchaseScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubScribeNowPopUp extends StatelessWidget {
  const SubScribeNowPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xff002758),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Subscribe",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "You need to subscribe to ask question to BotInfo.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const InAppPurchaseScreen());
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              decoration: const BoxDecoration(
                color: Color(0xff006FFF),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Text("Subscribe Now",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
