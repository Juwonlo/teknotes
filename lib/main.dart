import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:teknotes/features/view/documentation_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknotes/features/view/e_signing_view.dart';
import 'package:teknotes/features/view/home_screen.dart';
import 'package:teknotes/features/view/profile_screen.dart';

import 'features/forms/vitals_form.dart';
import 'features/view/documentation_content.dart';
import 'features/view/search_document.dart';
import 'features/view/share_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit (
      designSize: Size(428,926),
      builder: (BuildContext, Widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchDocument(),
      )
    );

  }
}


