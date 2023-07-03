import 'package:flutter/material.dart';
import 'package:teknotes/src/view/e_signing_2.dart';
import '../../utils/constants.dart';

class Signing extends StatefulWidget {
  const Signing({Key? key}) : super(key: key);

  @override
  State<Signing> createState() => _SigningState();
}

class _SigningState extends State<Signing> {
  String dateTime = 'April 9, 12:40pm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 35,
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Material(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(4),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  PrimaryText(
                    text: 'E-signing',
                    size: 30,
                    color: AppColor.secondaryColor,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 10.0, left: 20.0, right: 20),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffD1E5FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: 28,
                                width: 7,
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
                                height: 85,
                                width: 150,
                                child: Image.asset(
                                    'assets/images/frame-11253.png',
                                    fit: BoxFit.fill)),
                          ),
                          Align(
                            alignment: const Alignment(-1, 0.83),
                            child: SecondaryText(text: 'CTO Signature'),
                            // SecondaryText(text: dateTime, size: 9,)
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: SecondaryText(
                                text: dateTime,
                                size: 9,
                              )),
                        ],
                      ))),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffD1E5FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: 28,
                                width: 7,
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
                                height: 85,
                                width: 150,
                                child: Image.asset('assets/images/image-4.png',
                                    fit: BoxFit.fill)),
                          ),
                          Align(
                            alignment: const Alignment(-1, 0.83),
                            child: SecondaryText(text: 'CTO Signature'),
                            // SecondaryText(text: dateTime, size: 9,)
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: SecondaryText(
                                text: dateTime,
                                size: 9,
                              )),
                        ],
                      ))),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Signing2()));
          },
          elevation: 2,
          child: Image.asset(
            'assets/images/create_note.png',
            fit: BoxFit.fill,
          ),
        ));
  }
}
