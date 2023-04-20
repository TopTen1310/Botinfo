import 'package:flutter/material.dart';
import 'package:Botinfo/Controllers/PurchaseController.dart';
import 'package:Botinfo/Widgets/SubscriptionPlanButtons.dart';
import 'package:get/get.dart';

class SubscriptionButtons extends GetView<PurchaseController> {
  const SubscriptionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SubscriptionPlanButton(
            buttonText: "3 days free trial",
            currentPurchase: controller.currentSubscription.value ==
                SubscriptionTypes.FreeTrial,
            onTap: () {
              controller.selectedSubscriptionType.value =
                  SubscriptionTypes.FreeTrial;
            },
            isSelected: controller.selectedSubscriptionType.value ==
                SubscriptionTypes.FreeTrial,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => SubscriptionPlanButton(
            currentPurchase: controller.currentSubscription.value ==
                SubscriptionTypes.Weekly,
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
              currentPurchase:
                  true, //controller.currentSubscription.value == SubscriptionTypes.Yearly,
              onTap: () {
                controller.selectedSubscriptionType.value =
                    SubscriptionTypes.Yearly;
              },
              isSelected: controller.selectedSubscriptionType.value ==
                  SubscriptionTypes.Yearly,
              isBestSeller: true,
              buttonText: "${controller.products[1].price}/year",
            )),
      ],
    );
  }
}
