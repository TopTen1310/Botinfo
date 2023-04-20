import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelSubscriptionPopUp extends StatelessWidget {
  const CancelSubscriptionPopUp({super.key});

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
            "Cancel Subscription",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Are you sure you want to cancel current subscription?",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 22),
                    decoration: BoxDecoration(
                      color: const Color(0xff006FFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text("Yes",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  )),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color(0xff006FFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text("No",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
