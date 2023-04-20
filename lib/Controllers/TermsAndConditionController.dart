import 'package:Botinfo/chat_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsAndConditionController extends GetxController {
  RxBool agreeTandC = false.obs;
  RxBool agreePrivacy = false.obs;
  RxBool alreadyAgreed = false.obs;
  late SharedPreferences sharedPreferences;

  @override
  onInit() async {
    super.onInit();

    // Obtain shared preferences.
    sharedPreferences = await SharedPreferences.getInstance();
    checkIfPrivacyPolicyAndTCAccepted();
  }

  Future<void> storeToLocal() async {
    if (agreePrivacy.value && agreeTandC.value) {
      await sharedPreferences.setBool("agreeTandC", agreeTandC.value);
      await sharedPreferences.setBool("agreePrivacy", agreePrivacy.value);
      alreadyAgreed.value = true;
      Get.offAll(() => const ChatScreen());
    }
  }

  Future<void> checkIfPrivacyPolicyAndTCAccepted() async {
    bool tc = sharedPreferences.getBool("agreeTandC") ?? false;
    bool pp = sharedPreferences.getBool("agreePrivacy") ?? false;

    alreadyAgreed.value = pp && tc;
  }
}
