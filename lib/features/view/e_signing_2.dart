import 'package:flutter/material.dart';
import 'package:teknotes/common/constants.dart';
import 'e_signing_view.dart';

class Signing2 extends StatefulWidget {
  const Signing2({Key? key}) : super(key: key);

  @override
  State<Signing2> createState() => _Signing2State();
}

class _Signing2State extends State<Signing2> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 45,),
        Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Material(
                color: AppColor.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 100,),
            PrimaryText(
              text: 'E-signing',
              size: 30,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 25,
                child: Image.asset(
                  'assets/images/vector-aNh.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 25,
                width: 28,
                child: Image.asset(
                  'assets/images/vector-c3o.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                width: 35,
                child: Image.asset(
                  'assets/images/tick.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 13),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                width: 28,
                child: Image.asset(
                  'assets/images/person.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Container(
              height: 400,
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.asset(
                'assets/images/frame-11253.png',
              )),
        ),
        AppButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SigningView()));
            },
            child: PrimaryText(
              text: 'Done',
              color: Colors.white,
            ))
      ],
    ));
  }
}
