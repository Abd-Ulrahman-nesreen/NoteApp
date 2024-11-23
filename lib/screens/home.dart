import 'package:flutter/material.dart';
import '../widgets/home_body.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/home_fab.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      floatingActionButton: HomeFAB(width: width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: const MyAppBar(),
      body: HomeBody(height: height, width: width),
    );
  }
}




