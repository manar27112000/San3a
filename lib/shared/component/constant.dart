

import 'package:san3a/shared/component/component.dart';

import '../../modules/Login_Screen/Login_Screen.dart';
import '../network/local/cache_helper.dart';

void signOut(context) async {
  await CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, Login_Screen());
    }
  });
}

void printFullText(String text) {
  //Copied Method
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

 String? token;

/*maaaaaaaaaaaaaaaaaanaaaaaaaaaaaaaaaaaaaaaaarrrrrrrrrrrrrr*/
class ApiConst{
  // https://accept.paymob.com/api/auth/tokens
  static const String baseUrl=" https://accept.paymob.com/api";
  static const String getAuthToken="/auth/tokens";
  static const String paymentApiKey="ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TnpnMk5ESTJMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuUGN4NGRPRjRkc1VrcE9QSFJLRldpbHI1cjFmOUNNM25CVVRVNDZ4NVkwcEFHTXF3SUp5THY5ZDVOYmk2LXpwNG15cWNKR2pYbmVnbXhpbHdCNnN3clE";
  static const String getOrderId="/ecommerce/orders";
  static const String getPaymentId="/acceptance/payment_keys";
  static const String getRefCode="/api/acceptance/payments/pay";
  static String visaUrl='$baseUrl/acceptance/iframes/759242?payment_token=$finalToken';
  static String paymentFirstToken="";
  static String payementOrderId="";
  static String finalToken="";
  static String refCode="";
  static String inegrationIdKiosk='3887197';
  static String integrationIdCart='3801918';
}

bool isArabic =true ;