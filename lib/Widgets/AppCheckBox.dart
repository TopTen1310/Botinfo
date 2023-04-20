import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {super.key,
      required this.text,
      required this.onTextTap,
      required this.isSelected,
      required this.onTap});
  final String text;
  final bool isSelected;
  final Function() onTap;
  final Function() onTextTap;

  
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected ? const Color(0xff006FFF) : Colors.white),
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xff006FFF) : Colors.transparent),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 11,
          ),
        ),
      ),
      const SizedBox(
        width: 13,
      ),
      GestureDetector(
        onTap: () => onTextTap(),
        child: RichText(
            text: TextSpan(
                text: "i agree with ",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                children: [
              TextSpan(
                  text: text,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white))
            ])),
      )
    ]);
  }
}
