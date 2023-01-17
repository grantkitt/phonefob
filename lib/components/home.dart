import 'package:flutter/material.dart';
import 'package:phonefob/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  _Home({Key? key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [Container(), PassDisplay(pass: 'Rillas 605')]),
    );
  }
}

class PassDisplay extends StatelessWidget {
  PassDisplay({Key? key, required this.pass});
  var pass;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          width: size.width - 40,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kBlack),
          child: Center(
              child: Text(
            pass,
            style: TextStyle(fontFamily: kFont, fontSize: 30, color: kWhite),
          )),
        ));
  }
}
