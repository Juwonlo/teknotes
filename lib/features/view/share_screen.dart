import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';


class Share extends StatefulWidget {
  const Share({Key? key}) : super(key: key);

  @override
  State<Share> createState() => _ShareState();
}

List option = <String>[
  'Anyone with link can view',
  'Only people invited',
];

class _ShareState extends State<Share> {
  String currentOption = option[0];
  String mail = 'ajaniben123456@gmail.com';

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
                width: 100.w,
              ),
              PrimaryText(
                text: 'Share',
                size: 30.sp,
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
           SizedBox(height: 30.h,),
          AppTile(titleText: 'Email', subText: mail),
           SizedBox(height: 15.h,),
          AppTile(titleText: 'Role', subText: 'Can sign', trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const RoleMenu();
                    });
              },
              icon: const Icon(Icons.menu_rounded)),),
           SizedBox(height: 25.h,),
          Padding(
            padding:  EdgeInsets.only(left: 25.w),
            child: PrimaryText(
              text: 'Share',
              size: 20.sp,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          RadioListTile(
              activeColor: AppColor.secondaryColor,
              title: PrimaryText(
                text: option[0],
                color: AppColor.primaryColor,
                size: 20.sp,
                fontWeight: FontWeight.w400,
              ),
              value: option[0],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              }),
          RadioListTile(
              activeColor: AppColor.secondaryColor,
              title: PrimaryText(text: option[1],
                  color: AppColor.primaryColor,
                size: 20.sp,
                fontWeight: FontWeight.w400,
              ),
              value: option[1],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              }),
           SizedBox(
            height: 40.h,
          ),
          AppButton(
              onTap: () {},
              backgroundColor: AppColor.secondaryColor,
              child: PrimaryText(
                text: 'Send Invitation',
                color: Colors.white,
                size: 16.sp,
                fontWeight: FontWeight.w400,
              )),
           SizedBox(height: 30.h,),
          AppButton(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 21.h,
                    width: 20.w,
                    child: Image.asset(
                      'assets/images/copy.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                   SizedBox(
                    width: 5.w,
                  ),
                  PrimaryText(
                    text: 'Copy Link',
                    color: AppColor.secondaryColor,
                    size: 16.sp,
                    fontWeight: FontWeight.w400,
                  )
                ],
              )),
           SizedBox(height: 30.h,),
          PrimaryText(
            text: 'People than can access',
            size: 20.sp,
            color: AppColor.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
           SizedBox(
            height: 20.h,
          ),
          AppTile(titleText: mail, subText: 'Owner', trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),),
           SizedBox(height: 15.h,),
          AppTile(titleText: mail, subText: 'Can sign', trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const MenuList();
                    });
              },
              icon: const Icon(Icons.menu_rounded))),
        ],
      ),
    );
  }
}
