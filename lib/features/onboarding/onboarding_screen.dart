import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknotes/common/constants.dart';
import 'package:teknotes/features/auth/create_account.dart';
import 'package:teknotes/features/auth/sign_in.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String conditionUrl = 'Privacy and Terms';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SecondaryText(
              textAlign: TextAlign.center,
              text: 'Document Management\nTools To Manage, Edit,E-Sign,\nAnd More!',
              size: 25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
           SizedBox(
              height:20.h
          ),
          Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: <TextSpan>[
                   TextSpan(
                      text: 'By Proceeding You Agree To Our\n',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w300)),
                  TextSpan(
                      text: conditionUrl,
                      style: TextStyle(fontSize: 14.sp, color: AppColor.primaryColor, fontWeight: FontWeight.w300))
                ])),
          ),
           SizedBox(
              height:20.h
          ),
          AppButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateAccount()));
            },
            backgroundColor: AppColor.secondaryColor,
            child: PrimaryText(text:' Create Account', color: Colors.white,),
          ),
           SizedBox(
              height:30.h
          ),
          AppButton(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SignIn()));
            },
            borderWidth: 1.0.w,
            child: PrimaryText(
              text: 'Log in',
            ),
          ),
           SizedBox(
              height:30.h
          ),
          Row(
              children: [
                 const Expanded(child: Divider(color: Colors.black54,)),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: PrimaryText(
                    text: 'Or',
                  ),
                ),
               const Expanded(child:  Divider(color: Colors.black54,)) ,
              ],
            ),
           SizedBox(
              height:30.h
          ),
          AppButton(
            onTap: () {},
            borderWidth: 1.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  width: 30.w,
                  child: Image.asset(
                    'assets/images/google.png',
                    fit: BoxFit.fill,
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
                PrimaryText(
                  text: 'Continue with Google',
                ),
              ],
            ),
          ),
           SizedBox(
              height:30.h
          ),
          AppButton(
            onTap: () {},
            borderWidth: 1.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  width: 40.w,
                  child: Image.asset(
                    'assets/images/facebook.png',
                    fit: BoxFit.fill,
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
                PrimaryText(text: 'Continue with Facebook',),
              ],
            ),
          ),
           SizedBox(
              height:30.h
          ),
          AppButton(
            onTap: () {},
            borderWidth: 1.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
              height: 20.h,
              width: 35.w,
                  child: Image.asset(
                    'assets/images/apple_store.png',
                    fit: BoxFit.fill,
                  ),
                ),
                 SizedBox(
                  width: 10.w,
                ),
                PrimaryText(text: 'Continue with Apple',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





