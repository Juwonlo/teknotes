import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  String formName = 'Design feedback';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                    fixedSize: Size(177.w, 58.h),
                    backgroundColor: AppColor.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r))),
                child: PrimaryText(
                  text: 'Question',
                  size: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                    fixedSize: Size(177.w, 58.h),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: AppColor.secondaryColor),
                        borderRadius: BorderRadius.circular(8.r))),
                child: PrimaryText(
                  text: 'Responses',
                  size: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondaryColor,
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.h, bottom: 30.h),
            child: AppTile(titleText: 'Form Name', subText: 'Design feedback'),
          ),
          Container(
            height: 140.h,
            width: 365.w,
            decoration: BoxDecoration(
              border: Border.all(width: 1,),
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.transparent,
            ),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                hintText: 'Untitled Question',
                hintStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 17.h,
                  width: 13.w,
                  child: Image.asset(
                    'assets/images/bold.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
               const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 17.h,
                  width: 13.w,
                  child: Image.asset(
                    'assets/images/italic.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 25.h,
                  width: 27.w,
                  child: Image.asset(
                    'assets/images/letter.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 25.h,
                  width: 25.w,
                  child: Image.asset(
                    'assets/images/underline.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 25.h,
                  width: 20.w,
                  child: Image.asset(
                    'assets/images/alphabet.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 25.h,
                  width: 25.w,
                  child: Image.asset(
                    'assets/images/strike.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(flex: 5,),
            ],
          )
        ],
      ),
    );
  }
}
