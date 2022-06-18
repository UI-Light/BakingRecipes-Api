import "package:flutter/material.dart";
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:scamp_assessment/ui/views/recipes_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenViewState();
  }
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RecipesView(), //recipe: recipe
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8C8DC),
      body: Center(
        child: Text(
          'Recipe App',
          style: GoogleFonts.pacifico(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
