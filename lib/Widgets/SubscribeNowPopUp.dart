import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

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
        children: const [
          Text(
            "Subscribe",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You need to subscribe to ask question to BotInfo.",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }
}
