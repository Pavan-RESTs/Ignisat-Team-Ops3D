import 'package:flutter/material.dart';

class AirQualityCard extends StatelessWidget {
  final Map<String, String> data;

  const AirQualityCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      child: Column(
        children: [
          Text(
            "Location statistics",
            style: TextStyle(color: Colors.teal.shade200),
          ),
          SizedBox(
            height: 25,
          ),
          for (int i = 0; i < data.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.keys.elementAt(i),
                  style: TextStyle(color: Colors.teal.shade200, fontSize: 14),
                ),
                Text(
                  data.values.elementAt(i),
                  style: TextStyle(color: Colors.teal.shade200, fontSize: 14),
                )
              ],
            )
        ],
      ),
    );
  }
}
