import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phonefob/constants.dart';

class createFobBody extends StatefulWidget {
  createFobBody({Key? key});
  @override
  State<createFobBody> createState() => _createFobBody();
}

class _createFobBody extends State<createFobBody> {
  _createFobBody({Key? key});
  var nameController = TextEditingController();
  var codeController = TextEditingController();
  var isHome = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: size.height - 50,
            width: size.width - 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: kGrey),
            child: Column(children: [
              Container(height: 20),
              const Text(
                'Creating new fob...',
                style: TextStyle(
                    fontFamily: kFont, color: kDarkGrey, fontSize: 20),
              ),
              Container(height: 120),
              Container(
                width: size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: kDarkGrey),
                child: Center(
                    child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: kBlack, fontSize: 20, fontFamily: kFont),
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter name...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20, fontFamily: kFont, color: kWhite),
                        ))),
              ),
              Container(height: 20),
              Container(
                width: size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: kDarkGrey),
                child: Center(
                    child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: kBlack, fontSize: 20, fontFamily: kFont),
                        controller: codeController,
                        decoration: const InputDecoration(
                          hintText: 'Enter code...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 20, fontFamily: kFont, color: kWhite),
                        ))),
              ),
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kHome,
                    color: kBlack,
                    height: 40,
                    width: 40,
                  ),
                  Container(width: 10),
                  CupertinoSwitch(
                    trackColor: kDarkGrey,
                    activeColor: kBlue,
                    value: isHome,
                    onChanged: (bool newValue) {
                      setState(() {
                        isHome = newValue;
                      });
                    },
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          color: kRed, borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                color: kWhite,
                                fontFamily: kFont,
                                fontSize: 20)),
                      ))),
              Container(height: 10),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text('Create Pass',
                            style: TextStyle(
                                color: kWhite,
                                fontFamily: kFont,
                                fontSize: 20)),
                      ))),
              Container(height: 30)
            ]),
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}
