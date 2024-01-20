import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknotes/common/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SearchDocument extends StatefulWidget {
  const SearchDocument({Key? key}) : super(key: key);

  @override
  State<SearchDocument> createState() => _SearchDocumentState();
}

class _SearchDocumentState extends State<SearchDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 137.h - 44.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Stack(
            children: [
              // const SizedBox(height: 45,),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/Group 585.png',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: const Alignment(-0.7, 0),
                child: PrimaryText(
                  text: 'Search for any of\nyour file, document,\nforms,e.t.c ',
                  size: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                    bottom: 35.h,
                    left: 15.w,
                    right: 15.w,
                  ),
                  child: Column(
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
                            text: 'Documents',
                            size: 30.sp,
                            color: AppColor.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding:  EdgeInsets.all(10.r),
                                filled: true,
                                fillColor: const Color(0xffD1E5FF),
                                prefixIcon: const Icon(
                                  Icons.filter_list_outlined,
                                  color: AppColor.secondaryColor,
                                ),
                                hintText: 'Search',
                                hintStyle: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:  BorderSide(
                                      color: Colors.black, width: 1.0.w),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:  BorderSide(
                                      color: Colors.black, width: 1.0.w),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: const CircleAvatar(
                              backgroundColor: AppColor.secondaryColor,
                              child: Icon(Icons.search_outlined),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: const Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
