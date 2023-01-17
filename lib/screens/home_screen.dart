import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phonefob/components/home.dart';
import 'package:phonefob/constants.dart';
import 'package:phonefob/screens/createFob_screen.dart';
import 'package:phonefob/screens/useFobScreen.dart';
import 'package:phonefob/testcases.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});
  @override
  var searchController = TextEditingController();
  var homePass = 'Hilltop 604';
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(320),
          child: Container(
            height: 400,
            width: 100,
            color: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 50),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Center(
                          child: TextField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: kBlack,
                                  fontSize: 20,
                                  fontFamily: kFont),
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: 'search for fobs...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontFamily: kFont,
                                    color: kGrey),
                              ))),
                    ),
                  ),
                  Container(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UseFobScreen(pass: hilltop)),
                      );
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                          width: size.width - 40,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kBlack),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(children: [
                                    Container(height: 20),
                                    Row(
                                      children: [
                                        Container(width: 20),
                                        SvgPicture.asset(
                                          kHome,
                                          height: 30,
                                          width: 30,
                                          color: kWhite,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                    const Spacer(),
                                  ]),
                                ),
                                Text(
                                  homePass,
                                  style: const TextStyle(
                                      color: kWhite,
                                      fontFamily: kFont,
                                      fontSize: 40),
                                ),
                                const Spacer(),
                              ])),
                    ),
                  )
                ]),
          ),
        ),
        backgroundColor: kBackground,
        body: Home(),
        bottomNavigationBar: Container(
          height: 75,
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateFobScreen()),
                );
              },
              child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: kBlue),
                    child: const Center(
                        child: Text(
                      'New Fob',
                      style: TextStyle(
                          color: kWhite, fontFamily: kFont, fontSize: 22),
                    )),
                  )),
            )
          ]),
        ));
  }
}
