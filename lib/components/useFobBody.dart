import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phonefob/Files.dart';
import 'package:phonefob/constants.dart';

class useFobBody extends StatefulWidget {
  useFobBody({Key? key, required this.pass});
  Pass pass;
  @override
  State<useFobBody> createState() => _useFobBody(pass: pass);
}

class _useFobBody extends State<useFobBody> {
  _useFobBody({Key? key, required this.pass});
  Pass pass;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(children: [
        const Spacer(),
        Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 10,
          child: Container(
            height: size.height - 40,
            width: size.width - 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: kBlack),
            child: Column(children: [
              Container(height: 20),
              Row(
                children: [
                  Container(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(kLeft,
                        color: kWhite, height: 35, width: 35),
                  )
                ],
              ),
              Container(height: 60),
              Container(
                width: 200,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Entering...',
                        style: TextStyle(
                            color: kGrey,
                            fontFamily: kFont,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        pass.name,
                        style: TextStyle(
                            color: kWhite, fontFamily: kFont, fontSize: 40),
                      ),
                    ]),
              ),
              const Spacer(),
              Container(
                height: 200,
                width: 200,
                // child: const CircularProgressIndicator(
                //   strokeWidth: 10,
                //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                //   backgroundColor: Colors.blue,
                // ),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    editFobModal();
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: kGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                    child: const Center(
                      child: Text(
                        'Edit Fob',
                        style: TextStyle(
                            color: kBlack,
                            fontFamily: kFont,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ]),
          ),
        ),
        const Spacer()
      ]),
    );
  }

  void editFobModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        var nameController = TextEditingController();
        var codeController = TextEditingController();
        var isHome = false;
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          // Get the height of the keyboard
          final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

          // Calculate the height of the modal bottom sheet
          final modalHeight = constraints.maxHeight - keyboardHeight;
          return Container(
            height: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: kGrey),
            child: Column(children: [
              const Spacer(),
              Container(
                width: size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: kLightGrey),
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
                              fontSize: 20,
                              fontFamily: kFont,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
              Container(height: 15),
              Container(
                width: size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: kLightGrey),
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
                              fontSize: 20,
                              fontFamily: kFont,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
              Container(height: 10),
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
                      isHome = newValue;
                    },
                  )
                ],
              ),
              Container(height: 10),
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
              Container(height: 15),
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
              Container(height: 20)
            ]),
          );
        });
      },
    );
  }
}
