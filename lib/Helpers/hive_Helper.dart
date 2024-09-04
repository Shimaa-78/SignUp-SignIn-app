import 'package:hive/hive.dart';

class HiveHelper {
  static const onboradingBox = "onboradingBox";
  static const token = "TOKEN";
  static void SetOnboardingVal() {
    Hive.box(onboradingBox).put("firstVisit", true);
  }

  static bool CheckFirstVisit() {
    if (Hive.box(onboradingBox).isEmpty) {
      return true;
    }
    return false;
  }
  static void setToken(String tokenParam) {
    Hive.box(token).put(token, tokenParam);
  }

  static String? getToken() {
    if (Hive.box(token).isNotEmpty) {
      return Hive.box(token).get(
        token,
      );
    }
    return null;
  }
}
