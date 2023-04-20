import 'package:Botinfo/Constants/TermsAndConditions.dart';
import 'package:Botinfo/Controllers/TermsAndConditionController.dart';
import 'package:Botinfo/PrivacyPolicyScreen.dart';
import 'package:Botinfo/Widgets/AppCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsScreen extends GetView<TermsAndConditionController> {
  const TermsAndConditionsScreen({super.key,this.showBackButton = false});
  final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    Get.put(TermsAndConditionController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Visibility(
            visible: showBackButton,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
            ),
          ),
          title: const Text(
            "Terms of Service",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                children: const [
                  Text(
                    termsAndCondidtions,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Visibility(
              visible: !controller.alreadyAgreed.value,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 46.0, bottom: 20, top: 10),
                    child: Obx(() => AppCheckBox(
                          text: "Terms of Service",
                          onTextTap: () {},
                          isSelected: controller.agreeTandC.value,
                          onTap: () {
                            controller.agreeTandC.value =
                                !controller.agreeTandC.value;
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46.0, bottom: 28),
                    child: Obx(
                      () => AppCheckBox(
                        onTextTap: () {
                          Get.to(() => const PrivacyPolicyScreen());
                        },
                        text: "Privacy policy",
                        isSelected: controller.agreePrivacy.value,
                        onTap: () {
                          controller.agreePrivacy.value =
                              !controller.agreePrivacy.value;
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await controller.storeToLocal();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: const BoxDecoration(
                        color: Color(0xff006FFF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text("I ACCEPT",
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.5,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
