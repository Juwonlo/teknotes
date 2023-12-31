import 'package:flutter/material.dart';
import 'package:teknotes/src/view/documentation_2.dart';
import 'package:teknotes/utils/constants.dart';

class Documentation extends StatefulWidget {
  const Documentation({Key? key}) : super(key: key);

  @override
  State<Documentation> createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation> {
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
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              PrimaryText(
                text: 'Documents Name',
                size: 20,
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(flex: 3),
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
              const Spacer(),
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
              const Spacer(),
              GestureDetector(
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Expanded(
              child: TextFormField(
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Documentation2()),
              (route) => false);
        },
        elevation: 2,
        child: Image.asset(
          'assets/images/create_note.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
