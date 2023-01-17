import 'package:flutter/material.dart';
import 'package:phonefob/components/createFobBody.dart';

class CreateFobScreen extends StatelessWidget {
  CreateFobScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: createFobBody(),
    );
  }
}
