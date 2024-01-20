import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//Teknotes default app button
class AppButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;
  final Color? backgroundColor;
   final double borderWidth;
   const AppButton({Key? key,
     required this.onTap,
     required this.child,
     this.backgroundColor,
     this.borderWidth = 0.0,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
          fixedSize:  Size(367.w,58.h),
          backgroundColor: backgroundColor ?? Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              width: borderWidth,
            ),
          )
      ),
      child: child,
    );
  }
}





//Teknotes Normal Text
class PrimaryText extends StatelessWidget {
  final Color? color;
  final String text;
  double? size = 14.sp;
  TextOverflow overflow;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  PrimaryText(
      {Key? key,
        this.color = Colors.black,
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.size,
        this.fontWeight = FontWeight.normal,
        this.textAlign,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        color: color,
            fontSize: size,
            fontWeight: fontWeight,
      ),
    );
  }
}





//Teknotes linear gradient text
class SecondaryText extends StatelessWidget {
  final String text;
  double? size = 14.sp;
  TextOverflow overflow;
  FontWeight? fontWeight;
  TextAlign? textAlign;
   SecondaryText({Key? key,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffa800ff), Color(0xff2b62ff)])
            .createShader(bounds);
      },
      child: Text(
        text,
        textAlign: textAlign,
        style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: fontWeight,
        ),
      )
    );
  }
}






//Teknotes default textfield
class AppTextField extends StatefulWidget {
  final  TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool obcureText;
  final bool isReadOnly;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final bool enable;

  const AppTextField({
    Key? key,
    this.controller,
    this.hintText,
    required this.obcureText,
    required this.isReadOnly,
    this.prefixIcon,
    this.sufixIcon,
    required this.keyBoardType,
    this.validator,
    this.onChanged,
    this.enable = true,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      style: TextStyle(color: Colors.black, fontSize: 14.sp,),
      cursorColor: Colors.black,
      controller: widget.controller,
      readOnly: widget.isReadOnly,
      obscureText: widget.obcureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w400),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.sufixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide( width: 1.0),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide( width: 1.0),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      validator: widget.validator,
    );
  }
}

// Teknotes app Scaffold widget
class AppScaffold extends StatelessWidget {
  final Widget? floatingActionButton;
  final Widget body;
  const AppScaffold({Key? key, required this.body, this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(
              top: 137.h - 44.h,
              left: 24.w,
              right: 24.w,
            ),
            child: body,
          )
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}




//Teknotes app colour
class AppColor{
  static const Color primaryColor = Color(0xff2b62ff);
  static const Color secondaryColor=  Color(0xff1C0E4C);
  static LinearGradient colorgradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffa800ff),
      Color(0xff2b62ff),
    ],
  );
}

