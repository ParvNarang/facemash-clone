import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "About",
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
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SafeArea(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                        "The Elo rating system, named after its creator Arpad Elo. This rating system is used to rate the skills of the players in competitor-versus-competitor games like chess, football, baseball, and American football. \n\nElo believed in the following: Performance of each player in a game is a normal distribution of random variables. \nThe mean value of players irrespective of their performance in an individual game increases slowly. Initially invented as a rating system for chess players, Elo is now used as a fundamental rating system in most video games, snooker, scrabble, etc. \n\n The following algorithm is used to rank players",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntuMono(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Image.network(
                        "https://miro.medium.com/max/3155/1*eBze5LbMPWzH_jxoPGoImQ.png",
                        scale: 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.network(
                        "https://miro.medium.com/max/1838/1*0ieY3WCOi8xgQ42nuqhICQ.png",
                        scale: 2.5,
                      ),
                    ),
                    Text(
                        "Ra = Rating of Player 1\nRb = Rating of Player 2\n\nEa = Expected Value that Player 1 will win\n\nSa = Value changes to 1 if Player 1 wins else 0 \n\nR'a = Updated rating of Player 1\n\n K = K factor",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntuMono(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
