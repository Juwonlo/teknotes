import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';
import 'package:teknotes/services/create_account_controller.dart';
import 'package:get/get.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  CreateAccountController createAccountController =
      Get.put(CreateAccountController());
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Wrap(
          direction: Axis.horizontal,
          children: [
            SecondaryText(
              text: 'Create ',
              size: 32.sp,
              fontWeight: FontWeight.w400,
            ),
            SecondaryText(
              text: 'An Account',
              size: 32.sp,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
        SizedBox(height: 30.h),
        PrimaryText(
          text: 'quis cras tellus nibh egestas mauris venenatis\nnibh.',
          textAlign: TextAlign.left,
          size: 15.sp,
          fontWeight: FontWeight.w300,
        ),
        SizedBox(height: 20.h),
        SecondaryText(
          text: 'Full Name',
          size: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 3.h,
        ),
        AppTextField(
            controller: createAccountController.fullNameController,
            obcureText: false,
            isReadOnly: false,
            keyBoardType: TextInputType.text),
        SizedBox(height: 30.h),
        SecondaryText(
          text: 'E-mail',
          size: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 3.h,
        ),
        AppTextField(
            controller: createAccountController.emailController,
            obcureText: false,
            isReadOnly: false,
            keyBoardType: TextInputType.emailAddress),
        SizedBox(height: 30.h),
        SecondaryText(
          text: 'Password',
          size: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 3.h,
        ),
        AppTextField(
            controller: createAccountController.passwordController,
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
                createAccountController.createAccountWithEmail();
              },
              backgroundColor: AppColor.secondaryColor,
              child: PrimaryText(
                text: 'Create Account',
                color: Colors.white,
                size: 16.sp,
                fontWeight: FontWeight.w400,
              )),
        ),
        SizedBox(height: 30.h),
        Center(
            child: PrimaryText(
          text: 'Already have an account?',
          size: 15.sp,
          fontWeight: FontWeight.w400,
        )),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: SecondaryText(
              text: 'Sign in',
              size: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ]),
    );
  }
}
