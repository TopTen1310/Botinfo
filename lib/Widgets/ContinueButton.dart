import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          color: Color(0xff006FFF),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Text("CONTINUE",
            style: TextStyle(
              fontSize: 16.0,
              letterSpacing: 1.5,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
      ),
    );
  }
}
