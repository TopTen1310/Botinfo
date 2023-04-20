import 'package:Botinfo/Controllers/PurchaseController.dart';
import 'package:Botinfo/Widgets/ContinueButton.dart';
import 'package:Botinfo/Widgets/PremiumFeaturesList.dart';
import 'package:Botinfo/Widgets/SubscriptionButtons.dart';
import 'package:Botinfo/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InAppPurchaseScreen extends GetView<PurchaseController> {
  const InAppPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PurchaseController());
    return Stack(
      children: [
        const Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: _BodyWidget(),
            )),
        Obx(() => Visibility(
            visible: controller.isLoading.value,
            child: const Center(child: CircularProgressIndicator())))
      ],
    );
  }
}

class _BodyWidget extends GetView<PurchaseController> {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      SizedBox(
                        width: (270),
                        child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text('Welcome to BOTINFO',
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ))),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ChatScreen());
                    },
                    child: const Text('Skip',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff464648),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('GET ACCESS TO',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const PremiumFeaturesList()
              //
            ],
          ),
          const Spacer(),
          Obx(() => Visibility(
              visible: controller.products.value.length >= 2,
              child: const SubscriptionButtons())),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(
                    "assets/images/lock.png",
                    height: 17,
                    color: Colors.grey,
                  ),
                ),
                const Text('Secured with iTunes.Cancel anytime ',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8D8D92),
                    ))
              ],
            ),
          ),
          ContinueButton(onTap: () {
            controller.purchaseSubscription();
          })
        ],
      ),
    );
  }
}
