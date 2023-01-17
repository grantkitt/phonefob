import 'package:flutter/material.dart';
import 'package:phonefob/Files.dart';
import 'package:phonefob/components/useFobBody.dart';

class UseFobScreen extends StatelessWidget {
  UseFobScreen({Key? key, required this.pass});
  Pass pass;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: useFobBody(pass: pass),
    );
  }
}
