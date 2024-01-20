import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';
import 'package:teknotes/features/auth/create_account.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            SecondaryText(
              text: 'Welcome Back!',
              size: 32.sp,
              fontWeight: FontWeight.w400,
            ),
            PrimaryText(
              text: 'Enter Your Details',
              size: 32.sp,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 30.h),
        PrimaryText(
          textAlign: TextAlign.left,
          text: 'quis cras tellus nibh egestas mauris venenatis\nnibh.',
          size: 15.sp,
          fontWeight: FontWeight.w300,
        ),
        SizedBox(height: 20.h),
        PrimaryText(
          text: 'E-mail',
          size: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.secondaryColor,
        ),
        SizedBox(
          height: 3.h,
        ),
        AppTextField(
            controller: emailController,
            obcureText: false,
            isReadOnly: false,
            keyBoardType: TextInputType.emailAddress),
        SizedBox(height: 30.h),
        PrimaryText(
          text: 'Password',
          size: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.secondaryColor,
        ),
        SizedBox(
          height: 3.h,
        ),
        AppTextField(
            controller: passwordController,
            obcureText: isVisible,
            isReadOnly: false,
            keyBoardType: TextInputType.visiblePassword,
            sufixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: isVisible
                    ? const InvisiblePassword()
                    : const VisiblePassword())),
        SizedBox(height: 49.h),
        Center(
          child: AppButton(
              onTap: () {
                loginWithEmail();
              },
              backgroundColor: AppColor.secondaryColor,
              child: PrimaryText(
                text: 'Log in',
                size: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: AppButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccount()));
              },
              borderWidth: 1.0,
              child: PrimaryText(
                text: 'Create Account',
                size: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryColor,
              )),
        ),
        SizedBox(
          height: 30.h,
        ),
        Center(
            child: GestureDetector(
          onTap: () {},
          child: PrimaryText(
            text: 'Forget Password?',
            size: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ))
      ],
    ));
  }

  Future<void> loginWithEmail() async {
    var url = Uri.parse('https://teknotes-5e8e7844759b.herokuapp.com/login');
    Map data = {
      'email': emailController.text.trim(),
      'password': passwordController.text,
    };
    var jsonData = jsonEncode(data);
    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var token = responseData['token'];
        print('token: $token');
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        emailController.clear();
        passwordController.clear();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavigation()));
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        return showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  title: PrimaryText(text: 'Error'),
                  contentPadding: const EdgeInsets.all(20),
                  children: const [Text('Invalid Email or password')],
                ));
      } else if (response.statusCode == 500) {
        // ignore: use_build_context_synchronously
        return showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: PrimaryText(text: 'Error'),
            contentPadding: const EdgeInsets.all(20),
            children: const [Text('Internal Server Error')],
          ),
        );
      } else {
        print('Login failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      showDialog(
          context: context,
          builder: (context) => SimpleDialog(
                title: PrimaryText(text: 'Error'),
                contentPadding: const EdgeInsets.all(20),
                children: [Text(error.toString())],
              ));
    }
  }
}
