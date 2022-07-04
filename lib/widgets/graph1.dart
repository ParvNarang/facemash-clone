import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

class Graph1 extends StatefulWidget {
  const Graph1({Key? key}) : super(key: key);

  @override
  State<Graph1> createState() => _Graph1State();
}

class _Graph1State extends State<Graph1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Column(
            children: [
              Text("Graph",
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
              const SizedBox(
                height: 10,
              ),
              Text("(X axis - Id of players Y axis - Rating of players)",
                  style: GoogleFonts.ubuntuMono(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 105, 16, 16),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: BarChart(
                BarChartData(
                    backgroundColor: Colors.white,
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.black,
                          strokeWidth: 0.1,
                        );
                      },
                      horizontalInterval: 10,
                    ),
                    borderData: FlBorderData(
                        border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 0.5),
                      bottom: BorderSide(width: 0.5),
                    )),
                    barGroups: [
                      for (int i = 0; i < L.length; i++)
                        if (L[i][3] > 300) ...[
                          BarChartGroupData(x: L[i][0], barRods: [
                            BarChartRodData(
                                toY: L[i][3],
                                width: 10,
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(1))
                          ]),
                        ] else ...[
                          BarChartGroupData(x: L[i][0], barRods: [
                            BarChartRodData(
                                toY: L[i][3],
                                width: 10,
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(1))
                          ]),
                        ]
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
