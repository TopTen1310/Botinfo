import 'package:flutter/material.dart';

class SubscriptionPlanButton extends StatelessWidget {
  const SubscriptionPlanButton(
      {super.key,
      required this.onTap,
      required this.isSelected,
      this.isBestSeller = false,
      required this.buttonText});

  final Function() onTap;
  final bool isSelected;
  final String buttonText;
  final bool isBestSeller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              width: isSelected ? 3 : 1,
              color: isSelected
                  ? const Color(0xff006FFF)
                  : const Color(0xffD9D9D9)),
          color: isSelected ? const Color(0x66006FFF) : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Text(buttonText,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
            ),
            Visibility(
              visible: isBestSeller,
              child: Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: const Text(
                      "Best Seller",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
