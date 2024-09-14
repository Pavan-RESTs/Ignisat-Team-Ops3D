import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FirePlotLine extends StatefulWidget {
  final String collectionName;
  final String documentName;
  final String keyId;
  final String xAxisLabel;
  final String yAxisLabel;
  // NEW: Added color parameters for axis labels and text
  final Color xAxisLabelColor;
  final Color yAxisLabelColor;
  final Color axisTextColor;

  const FirePlotLine({
    Key? key,
    required this.collectionName,
    required this.documentName,
    required this.keyId,
    this.xAxisLabel = 'X Axis',
    this.yAxisLabel = 'Y Axis',
    // NEW: Default colors set to black
    this.xAxisLabelColor = Colors.white,
    this.yAxisLabelColor = Colors.white,
    this.axisTextColor = Colors.white,
  }) : super(key: key);

  @override
  _FirePlotLineState createState() => _FirePlotLineState();
}

class _FirePlotLineState extends State<FirePlotLine> {
  List<FlSpot> spots = [];
  double minY = 0;
  double maxY = 1;
  double minX = 0;
  double maxX = 1;
  double xScale = 1;
  double yScale = 0.5;

  @override
  void initState() {
    super.initState();
    _setupFirebaseListener();
  }

  void _setupFirebaseListener() {
    FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(widget.documentName)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data()?[widget.keyId];
        if (data != null && data is num) {
          setState(() {
            if (spots.isEmpty) {
              maxX = 0;
            } else {
              maxX += 1;
            }

            spots.add(FlSpot(maxX, data.toDouble()));

            if (data > maxY) {
              maxY = data.toDouble();
            }
            if (data < minY) {
              minY = data.toDouble();
            }

            _adjustScales();
          });
        }
      }
    });
  }

  void _adjustScales() {
    if (maxX >= 10 * xScale) {
      xScale = _nextScale(xScale);
    }

    double rangeY = maxY - minY;
    if (rangeY >= 5 * yScale) {
      yScale = _nextScale(yScale);
    }

    if (rangeY < 1) {
      maxY = minY + 1;
    }
  }

  double _nextScale(double currentScale) {
    if (currentScale == 1) return 2;
    if (currentScale == 2) return 5;
    if (currentScale == 5) return 10;
    return currentScale * 2;
  }

  String _getAxisLabel(double value) {
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7777777777777,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: spots.isEmpty
            ? Center(child: CircularProgressIndicator())
            : LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      // NEW: Applied custom color to X-axis label

                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        // NEW: Applied custom color to X-axis text
                        getTitlesWidget: (value, meta) => Text(
                          _getAxisLabel(value),
                          style: TextStyle(color: widget.axisTextColor),
                        ),
                        interval: xScale,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      // NEW: Applied custom color to Y-axis label

                      sideTitles: SideTitles(
                        reservedSize: 40,
                        // NEW: Applied custom color to Y-axis text
                        getTitlesWidget: (value, meta) => Text(
                          _getAxisLabel(value),
                          style: TextStyle(color: widget.axisTextColor),
                        ),
                        interval: yScale,
                      ),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border:
                        Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  minX: minX,
                  maxX: maxX + xScale,
                  minY: minY,
                  maxY: maxY + yScale / 2,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.blue],
                      ),
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.cyan.withOpacity(0.3),
                            Colors.blue.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
