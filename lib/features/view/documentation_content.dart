import 'package:flutter/material.dart';
import 'package:teknotes/common/components.dart';
import 'package:teknotes/common/constants.dart';


class Documentation2 extends StatefulWidget {
  const Documentation2({Key? key}) : super(key: key);

  @override
  State<Documentation2> createState() => _Documentation2State();
}

class _Documentation2State extends State<Documentation2> {
  // List<Note> notes = [];
  String content = '';
  String? title = null;
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
            const SizedBox(width: 20,),
            PrimaryText(
              text: 'Documents Name',
              size: 20,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 9),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) => const NameBox());
              },
              child: SizedBox(
                height: 25,
                // width: 7,
                child: Image.asset(
                  'assets/images/page-1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 75,),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 25,
                width: 7,
                child: Image.asset(
                  'assets/images/menu.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 20,
                child: Image.asset(
                  'assets/images/bold.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child:  SizedBox(
                height: 20,
                child: Image.asset(
                  'assets/images/italic.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/images/letter.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/images/underline.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/images/alphabet.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/images/strike.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/images/vector-W1s.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/images/page-1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Expanded(
            child: TextFormField(
              onChanged: (value) => content = value,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 500,),
        Positioned(
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 28,
                  child: Image.asset(
                    'assets/images/vector-eHs.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 28,
                  child: Image.asset(
                    'assets/images/vector-byo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 28,
                  child: Image.asset(
                    'assets/images/frame-56304.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        AppButton(
            onTap: (){
          Navigator.pop(context, Note(content, title!));
        },
            child: PrimaryText(text: 'save',))
      ],
    ));
  }
}
