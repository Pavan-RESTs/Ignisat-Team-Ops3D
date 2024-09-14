import 'package:flutter/material.dart';

import '../../custom_widgets/fireplotline.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 480,
                  height: 312,
                  child: Column(
                    children: [
                      Text(
                        "Temperature",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      FirePlotLine(
                        collectionName: "sensorData",
                        documentName: "latestData",
                        keyId: "Temperature",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 480,
                  height: 312,
                  child: Column(
                    children: [
                      Text(
                        "Humidity",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      FirePlotLine(
                        collectionName: "sensorData",
                        documentName: "latestData",
                        keyId: "Humidity",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 480,
                  height: 312,
                  child: Column(
                    children: [
                      Text(
                        "Methane",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      FirePlotLine(
                        collectionName: "sensorData",
                        documentName: "latestData",
                        keyId: "MQ135",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 480,
                  height: 315,
                  child: Column(
                    children: [
                      Text(
                        "Sulpher Dioxide",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      FirePlotLine(
                        collectionName: "sensorData",
                        documentName: "latestData",
                        keyId: "MQ2",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 480,
                  height: 315,
                  child: Column(
                    children: [
                      Text(
                        "Carbon Monoxide",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      FirePlotLine(
                        collectionName: "sensorData",
                        documentName: "latestData",
                        keyId: "MQ6",
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 480,
                  height: 315,
                  child: Column(
                    children: [
                      Text(
                        "Ammonia",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      FirePlotLine(
                        collectionName: "sensorData",
                        documentName: "latestData",
                        keyId: "MQ9",
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
