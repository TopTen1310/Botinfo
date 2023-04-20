import 'package:flutter/material.dart';
import 'package:Botinfo/Controllers/PurchaseController.dart';
import 'package:Botinfo/Widgets/SubscriptionPlanButtons.dart';
import 'package:get/get.dart';

class SubscriptionButtons extends GetView<PurchaseController> {
  const SubscriptionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      Obx(
          () => SubscriptionPlanButton(
            buttonText: "3 days free trial",
            onTap: () {
              controller.selectedSubscriptionType.value =
                  SubscriptionTypes.FreeTrial;
            },
            isSelected: controller.selectedSubscriptionType.value ==
                SubscriptionTypes.FreeTrial,
          ),
        ),
      Obx(
          () => SubscriptionPlanButton(
            buttonText: "${controller.products[0].price}/week",
            onTap: () {
              controller.selectedSubscriptionType.value =
                  SubscriptionTypes.Weekly;
            },
            isSelected: controller.selectedSubscriptionType.value ==
                SubscriptionTypes.Weekly,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(() => SubscriptionPlanButton(
              onTap: () {
                controller.selectedSubscriptionType.value =
                    SubscriptionTypes.Yearly;
              },
              isSelected: controller.selectedSubscriptionType.value ==
                  SubscriptionTypes.Yearly,
              isBestSeller: true,
              buttonText: "${controller.products[1].price}/year",
            )),
    ],);
  }
}