// ignore_for_file: deprecated_member_use
import 'package:facemash/widgets/about.dart';
import 'package:facemash/widgets/graph1.dart';
import 'package:facemash/widgets/howtoplay.dart';
import 'package:facemash/widgets/rankings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
import 'dart:io';
// import 'dart:convert';

int f1 = 0; //win flag1
int f2 = 0; //win flag2
List L = [
  [
    1,
    "Edward",
    "https://st2.depositphotos.com/1743476/11581/i/600/depositphotos_115812486-stock-photo-pride-man-smiling.jpg",
    0,
    0,
    0,
    0
  ],
  [
    2,
    "Tony",
    "https://i.insider.com/5dcc135ce94e86714253af21?width=1000&format=jpeg&auto=webp",
    0,
    0,
    0,
    0
  ],
  [
    3,
    "Elon",
    "https://static01.nyt.com/images/2021/01/30/business/29musk-print/29musk-1-mediumSquareAt3X.jpg",
    0,
    0,
    0,
    0
  ],
  [
    4,
    "Hila",
    "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7875841.jpg",
    0,
    0,
    0,
    0
  ],
  [
    5,
    "Madam",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNkMijMQuKTW4VorKp8BXxWXGnDvs3OCPghg&usqp=CAU",
    0,
    0,
    0,
    0
  ],
  [
    6,
    "Bella",
    "https://cdn.pixabay.com/photo/2017/03/30/18/17/girl-2189247_960_720.jpg",
    0,
    0,
    0,
    0
  ],
  [
    7,
    "Clery",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9yP4lDx2E2Yjz3oWFVHT-hDwNR8PmXt1_ccmaLFYNQWDvosmIqXDocdK7y8iGRGCZQ2Y&usqp=CAU",
    0,
    0,
    0,
    0
  ],
  [
    8,
    "Hilary",
    "https://as2.ftcdn.net/v2/jpg/02/46/34/43/1000_F_246344301_DVcPex3m2TRxZClCMps12wiqH26BD9EH.jpg",
    0,
    0,
    0,
    0
  ],
];

var t1 = []; //temporary list 1
final size = L.length;
var coords = List<List<double>>.generate(
    size, (int index) => List<double>.generate(0, (j) => 0),
    growable: true);
late int randomNumber1;
late int randomNumber2;
void loadAsset() async {
  var x = await rootBundle.loadString(
      '/Users/parvnarang/Developer/flutter-projects/facemash/assets/data.txt');
  final splitNames = x.split(',');
  List splitList = [];
  for (int i = 0; i < splitNames.length; i++) {
    splitList.add(double.parse(splitNames[i]).toDouble());
  }
  for (int i = 0; i < L.length; i++) {
    L[i][3] = splitList[i];
  }
  L.sort((a, b) => b[3].compareTo(a[3]));
}

// Future<String> _getDirPath() async {
//   final dir = await getApplicationDocumentsDirectory();
//   return dir.path;
// }

// Future<void> _writeData() async {
//   final _dirPath = await _getDirPath();

//   final _myFile = File('$_dirPath/data.txt');
//   // If data.txt doesn't exist, it will be created automatically
//   for (int i = 0; i < L.length; i++) {
//     print("writing");
//     await _myFile.writeAsString(
//       L[i][3].toString(),
//     );
//   }
// }

void randomselection() {
  //L.sort((a, b) => b[3].compareTo(a[3]));
  Random random = Random();
  while (t1.length < 2) {
    randomNumber1 = random.nextInt(L.length);
    randomNumber2 = random.nextInt(L.length);
    if (!t1.contains(randomNumber1) && t1.length < 2) {
      t1.add(randomNumber1);
    }
    if (t1.contains(randomNumber1) &&
        randomNumber1 != randomNumber2 &&
        t1.length < 2) {
      t1.add(randomNumber2);
    }
  }
  //print(t1);
  Cal().calculate();
}

class Cal {
  int K = 50; //50
  void calculate() {
    double Ra = L[t1[0]][3];
    double Rb = L[t1[1]][3];
    double x1 = (Rb - Ra) / 400;
    double x2 = (Ra - Rb) / 400;

    double Ea = 1 / (1 + pow(10, x1));
    double Eb = 1 / (1 + pow(10, x2));
    //print("Ea = ${Ea.toStringAsFixed(2)}");
    //print("Eb = ${Eb.toStringAsFixed(2)}");
  }

  void update() {
    double Ra = L[t1[0]][3];
    double Rb = L[t1[1]][3];
    double x1 = (Rb - Ra) / 400;
    double x2 = (Ra - Rb) / 400;

    double Ea = 1 / (1 + pow(10, x1));
    double Eb = 1 / (1 + pow(10, x2));

    // print(f1);
    // print(f2);
    // print(Ra);
    // print(Rb);
    double Ra1 = Ra + (K * (f1 - Ea));
    double Rb1 = Rb + (K * (f2 - Eb));

    //double score1 = Ra1 / (1 + (L[t1[0]][4] / L[t1[0]][5]));
    //double score2 = Rb1 / (1 + (L[t1[1]][4] / L[t1[1]][5]));
    double score1 = (Rb1 + 400 * (L[t1[0]][4] - L[t1[0]][5])) / L[t1[0]][6];
    double score2 = (Ra1 + 400 * (L[t1[1]][4] - L[t1[1]][5])) / L[t1[1]][6];
    //L[t1[0]][3] = score1;
    //L[t1[1]][3] = score2;

    L[t1[0]][3] = Ra1.toInt();
    L[t1[1]][3] = Rb1.toInt();
    coords[t1[0]].add((Ra1 / 1800));
    coords[t1[1]].add((Rb1 / 1800));
    //print("Updated Ra = ${L[t1[0]][3]}");
    //print("Updated Rb = ${L[t1[1]][3]}");
    L.sort((a, b) => b[3].compareTo(a[3]));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    loadAsset();
    randomselection();
    super.initState();
  }

  Widget build(BuildContext context) {
    //randomselection();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 105, 16, 16),
          title: Text("FACEMASH",
              style: GoogleFonts.ubuntuMono(
                  fontSize: 45,
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
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\nWere we let in for our looks? No. Will we be judged on them? Yes",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntuMono(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Click to choose",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntuMono(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            f1 = 1;
                            L[t1[0]][4] += 1; //win
                            L[t1[1]][5] += 1; //other lost
                            L[t1[0]][6] += 1;
                            print("${L[t1[0]][1]} won");
                            Cal().update();
                            t1.removeLast();
                            t1.removeLast();
                            randomselection();
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage("${L[t1[0]][2]}"),
                                ),
                              ),
                              height: 350,
                              width: 280,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${L[t1[0]][1]}",
                                  style: GoogleFonts.ubuntuMono(
                                      fontSize: 25,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 125,
                        child: Text(
                          "  OR",
                          style: GoogleFonts.ubuntuMono(
                              fontSize: 40,
                              wordSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            f2 = 1;
                            L[t1[1]][4] += 1; //win
                            L[t1[0]][5] += 1; //other lost
                            L[t1[1]][6] += 1;
                            print("${L[t1[1]][1]} won");
                            Cal().update();
                            t1.removeLast();
                            t1.removeLast();
                            randomselection();
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(L[t1[1]][2]),
                                ),
                              ),
                              height: 350,
                              width: 280,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${L[t1[1]][1]}",
                                style: GoogleFonts.ubuntuMono(
                                    fontSize: 25,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          t1.removeLast();
                          t1.removeLast();
                          randomselection();
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[200]),
                        child: const Icon(
                          Icons.replay_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: const Color.fromARGB(255, 105, 16, 16),
                width: double.infinity,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const About()),
                        );
                      },
                      child: Text(
                        " About ",
                        style: GoogleFonts.ubuntuMono(
                            fontSize: 17,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HowtoPlay()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "How to Play",
                            style: GoogleFonts.ubuntuMono(
                                fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ranking()),
                          );
                        },
                        child: Text(
                          "Rankings",
                          style: GoogleFonts.ubuntuMono(
                              fontSize: 17,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Graph1()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            " Graph ",
                            style: GoogleFonts.ubuntuMono(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
