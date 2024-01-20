import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';
import 'package:teknotes/features/forms/form.dart';
import 'package:teknotes/features/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userImg = 'assets/images/user.png';
  String userId = 'Bedlam';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 58.h,
                width: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  userImg,
                  fit: BoxFit.fill,
                ),
              ),
               SizedBox(
                width: 4.w,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                  child: PrimaryText(
                    text: userId,
                    size: 20.sp,
                    fontWeight: FontWeight.w400,
                  )),
              const Spacer(),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  fixedSize: Size(108.w, 40.h),
                    backgroundColor: const Color(0xffF2E8EA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: PrimaryText(
                  text: 'Support',
                  size: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
               SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 25.h,
                  width: 20.w,
                  child: Image.asset(
                    'assets/images/bell.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 40.h,),
          HomeBox(title: 'Templates',
              imgpath: 'assets/images/image-2.png',
              buttonCall: (){}
          ),
           SizedBox(height: 30.h,),
          HomeBox(title: 'Create Form',
              transformMatrix: Matrix4.rotationZ(0.3),
              imgpath: 'assets/images/image-3.png',
              buttonCall:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Forms()))
          ),
           SizedBox(height: 30.h,),
          HomeBox(title: 'Create Document',
              imgpath:'assets/images/image-5.png',
              buttonCall: (){}
          ),
        ],
      ),
    );
  }
}
