import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';
import 'package:teknotes/features/auth/sign_in.dart';
import 'package:teknotes/features/view/e_signing_view.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String userName = 'Ajani Ben D.';
  String user = 'username';
  String mail = 'ajaniben123456@gmail.com';
  String web = 'www.speakafrica.io';
  String industry = 'IT services';
  String location = 'Lagos, Nigeria';
  String employees = '1-6';
  String language = 'English';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Material(
                  color: AppColor.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Container(
                    padding:  EdgeInsets.all(3.r),
                    child:  Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
               SizedBox(
                width: 100.w,
              ),
              PrimaryText(
                text: 'Profile',
                size: 30.sp,
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
           SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              Container(
                height: 102.h,
                width: 102.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child:
                    Image.asset('assets/images/user.png', fit: BoxFit.fill),
              ),
               SizedBox(
                width: 12.w,
              ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    PrimaryText(
                        text: userName,
                        size: 24.sp,
                        fontWeight: FontWeight.w400),
                    PrimaryText(
                        text: '@$user',
                        size: 18,
                        fontWeight: FontWeight.w400),
                  ],
                ),
            ],
          ),
           SizedBox(
            height: 30.h,
          ),
          PrimaryText(
            text: 'Profile',
            size: 18.sp,
            fontWeight: FontWeight.w400,
          ),
           SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Personal Name', subText: userName,),
           SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Username', subText: '@$user',),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Business Name', subText: mail,),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Set Signature', subText: mail, trailing:IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),),
          SizedBox(
            height: 40.h,
          ),
          PrimaryText(
            text: 'Company Profile',
            size: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Business Email', subText: mail),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Company Address (Physical/Online)', subText: web),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Business Industry', subText: industry, trailing:IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Location', subText: location, trailing:IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Number of Employees', subText: employees, trailing:IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),),
          SizedBox(
            height: 40.h,
          ),
          PrimaryText(
            text: 'Others',
            size: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
            ),
            child: ListTile(
              leading: GestureDetector(
                  onTap: () {},
                  child: PrimaryText(
                    text: 'Password',
                    size: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryColor,
                  )),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
            ),
            child: ListTile(
              leading: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SigningView()));
                  },
                  child: PrimaryText(
                    text: 'Signature',
                    size: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryColor,
                  )),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
            ),
            child: ListTile(
              leading: GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs = await _prefs;
                    prefs.clear();

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignIn() ));
                  },
                  child: PrimaryText(
                    text: 'Log out',
                    size: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryColor,
                  )),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          AppTile(titleText: 'Language', subText: language, trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.menu_rounded)),)
        ],
      ),
    );
  }
}
