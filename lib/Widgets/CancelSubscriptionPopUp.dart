import 'package:flutter/material.dart';

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
        children: const [
          Text(
            "Are you sure you want to cancel current subscription?",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          
          SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}
