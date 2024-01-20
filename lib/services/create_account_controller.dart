import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';


class CreateAccountController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> createAccountWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url =
      Uri.parse('https://teknotes-5e8e7844759b.herokuapp.com/register');

      Map body = {
        "fullname": fullNameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "account_type": "     ",
        "zip_code": "     ",
        "company_name": "     ",
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.statusCode);

      switch (response.statusCode) {
        case (200):
          final json = jsonDecode(response.body);
          var token = json['token'];
          print('token: $token');

          final SharedPreferences prefs = await _prefs;

          await prefs.setString('token', token);
          fullNameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.off(const BottomNavigation());
          break;
        case (500):
          showDialog(
              context: Get.context!,
              builder: (context) => SimpleDialog(
                title: PrimaryText(text: 'Error'),
                contentPadding: EdgeInsets.all(20),
                children: const [Text('Internal Server Error')],
              ));
          break;

        case (400):
          showDialog(
              context: Get.context!,
              builder: (context) => SimpleDialog(
                title: PrimaryText(text: 'Error'),
                contentPadding: EdgeInsets.all(20),
                children: const [Text('Bad Request')],
              ));
          break;
        default:
          break;
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) => SimpleDialog(
            title: PrimaryText(text: 'Unknown Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          ));
    }
  }
}
