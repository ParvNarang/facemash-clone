import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowtoPlay extends StatelessWidget {
  const HowtoPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Game Play",
              style: GoogleFonts.ubuntuMono(
                  fontSize: 30,
                  letterSpacing: 1,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                        // bottomLeft
                        offset: Offset(2.5, 2.5),
                        color: Colors.black),
                    Shadow(
                        // bottomRight
                        offset: Offset(2.5, 2.5),
                        color: Colors.black),
                  ]),
            ),
            backgroundColor: const Color.fromARGB(255, 105, 16, 16),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "2 different images will be randomly generated, compare the two images and click on the image you like.\nThis rating will determine the score of the players and they'll be ranked accordingly.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntuMono(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                      wordSpacing: 1,
                      color: Colors.black),
                ),
              ),
            ),
          )),
    );
  }
}
