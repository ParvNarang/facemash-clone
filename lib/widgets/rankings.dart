import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Rankings",
              style: GoogleFonts.ubuntuMono(
                  fontSize: 35,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                        // bottomLeft
                        offset: Offset(2.5, 2.5),
                        color: Colors.black),
                    Shadow(
                        // bottomRight
                        offset: Offset(2.5, 2.5),
                        color: Colors.black),
                  ])),
          backgroundColor: const Color.fromARGB(255, 105, 16, 16),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView.builder(
            itemCount: L.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    selected: true,
                    selectedTileColor: Colors.grey[100],
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(L[index][2]),
                    //   radius: 30,
                    // ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index == 0) ...[
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 31.5,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(L[index][2]),
                                  radius: 30,
                                ),
                              ),
                              Text("    ${L[index][1]}  ",
                                  style: GoogleFonts.ubuntuMono(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 105, 16, 16),
                                  )),
                              const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ] else if (L[index][3] < 300) ...[
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 31.5,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(L[index][2]),
                                  radius: 30,
                                ),
                              ),
                              Text("    ${L[index][1]}  ",
                                  style: GoogleFonts.ubuntuMono(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 105, 16, 16),
                                  )),
                              const Icon(
                                Icons.heart_broken_rounded,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ] else ...[
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 31.5,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(L[index][2]),
                                  radius: 30,
                                ),
                              ),
                              Text("   ${L[index][1]}   ",
                                  style: GoogleFonts.ubuntuMono(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 105, 16, 16),
                                  )),
                              const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ]
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "\n\n W - ${L[index][4]}  L - ${L[index][5]}  Rating = ",
                            style: GoogleFonts.ubuntuMono(
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        if (L[index][3] > 300) ...[
                          Text(
                            "\n\n${L[index][3]}",
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                        if (L[index][3] < 300) ...[
                          Text(
                            "\n\n${L[index][3]}",
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
