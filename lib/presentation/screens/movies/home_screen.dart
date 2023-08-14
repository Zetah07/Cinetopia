import 'package:flutter/material.dart';
import 'package:cinetopia/presentation/widgets/widgets.dart';



class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  final Widget childView;


  const HomeScreen({
    super.key, 
    required this.childView,
    // required int pageIndex
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}