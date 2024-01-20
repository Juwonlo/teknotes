import 'package:flutter/material.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigningView extends StatefulWidget {
  const SigningView({Key? key}) : super(key: key);

  @override
  State<SigningView> createState() => _SigningViewState();
}

class _SigningViewState extends State<SigningView> {
  String dateTime = 'April 9, 12:40pm';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Material(
                    color: AppColor.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(3.r),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.sp,
                ),
                PrimaryText(
                  text: 'E-signing',
                  size: 30.sp,
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: 25.h, bottom: 10.0.h, left: 20.0.w, right: 20.w),
                child: Container(
                    height: 135.h,
                    width: 363.w,
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 20.0.w),
                    decoration: BoxDecoration(
                        color: const Color(0xffD1E5FF),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 25.h,
                              width: 7.w,
                              child: Image.asset(
                                'assets/images/menu.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 83.h,
                              width: 147.w,
                              child: Image.asset(
                                  'assets/images/frame-11253.png',
                                  fit: BoxFit.fill)),
                        ),
                        Align(
                          alignment: const Alignment(-1, 0.83),
                          child: SecondaryText(
                              text: 'CTO Signature',
                              size: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: SecondaryText(
                              text: dateTime,
                              size: 8.sp,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ))),
            Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.0.w),
                child: Container(
                    height: 135.h,
                    width: 363.w,
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 20.0.w),
                    decoration: BoxDecoration(
                        color: const Color(0xffD1E5FF),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 25.h,
                              width: 7.w,
                              child: Image.asset(
                                'assets/images/menu.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 82.h,
                              width: 147.w,
                              child: Image.asset('assets/images/image-4.png',
                                  fit: BoxFit.fill)),
                        ),
                        Align(
                          alignment: const Alignment(-1, 0.83),
                          child: SecondaryText(
                              text: 'CTO Signature',
                              size: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: SecondaryText(
                              text: dateTime,
                              size: 8.sp,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const Signature());
          },
          elevation: 2,
          child: Image.asset(
            'assets/images/create_note.png',
            fit: BoxFit.fill,
          ),
        ));
  }
}
