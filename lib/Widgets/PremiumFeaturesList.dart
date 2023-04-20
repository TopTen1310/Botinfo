import 'package:flutter/material.dart';

class PremiumFeaturesList extends StatelessWidget {
  const PremiumFeaturesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff1C1C1D),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 19, 15, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                    child: Image.asset(
                      "assets/images/check.png",
                      width: 19,
                    ),
                  ),
                  const Text('Unlimited Questions & Answer',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                    child: Image.asset(
                      "assets/images/check.png",
                      width: 19,
                    ),
                  ),
                  const Text('Highet Word Limit',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
