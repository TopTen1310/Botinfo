import 'dart:async';
import 'dart:developer';

import 'package:Botinfo/dio_api_client.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

enum SubscriptionTypes {
  Weekly("com.botinfo.app.weeklySubscription"),
  Yearly("com.botinfo.app.yearly"),
  FreeTrial("3DaysTrial");

  final String id;
  const SubscriptionTypes(this.id);
}

class PurchaseController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<SubscriptionTypes> selectedSubscriptionType = SubscriptionTypes.Weekly.obs;

  final Set<String> _kIds = <String>{
    'com.botinfo.app.weeklySubscription',
    'com.botinfo.app.yearly'
  };
  RxList<ProductDetails> products = <ProductDetails>[].obs;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  @override
  Future<void> onInit() async {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
    await getProductsList();

    super.onInit();
  }

  Future<void> getProductsList() async {
    isLoading.value = true;
    final ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      log("No prduct found!");
    }
    products.value = response.productDetails;
    for (var e in products) {
      log(e.price, name: e.id);
    }
    isLoading.value = false;
  }

  void purchaseSubscription() {
    ProductDetails? selectedSub = products.firstWhereOrNull(
        (element) => element.id == selectedSubscriptionType.value.id);
    if (selectedSub == null) {
      log("", error: "Failed to get ProductDetail!");
      return;
    }
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: selectedSub);
    InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        log("", error: "Purchase pending");
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          log("",
              error: purchaseDetails.error?.message ?? "null",
              name: "Purchase error");
          log("",
              error: purchaseDetails.error?.details.toString() ?? "null",
              name: "Purchase error details");
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          bool valid = true; //await _verifyPurchase(purchaseDetails);
          if (valid) {
            log("Purchase valid");
          } else {
            log("", error: "Purchase invalid");
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<bool> _verifyPurchase(
      PurchaseDetails purchaseDetails, bool isTest) async {
    var receiptBody = {
      'receipt-data': purchaseDetails.verificationData
          .localVerificationData, // receipt key you will receive in request purchase callback function
      'exclude-old-transactions': true,
      'password': '82ace73b693d4018945b60778bb9da7d'
    };
    final String url = isTest
        ? 'https://sandbox.itunes.apple.com/verifyReceipt'
        : 'https://buy.itunes.apple.com/verifyReceipt';
    final result = await DioResponse.postApi(
        url,
        // headers: {
        //   'Accept': 'application/json',
        //   'Content-Type': 'application/json',
        // },
        receiptBody);
    log(result.toString(), name: "verification resposne");
    return Future<bool>.value(true);
  }

  // Future<void> restoreUserPurchase()async{
  //   InAppPurchase.instance.
  // }
}
