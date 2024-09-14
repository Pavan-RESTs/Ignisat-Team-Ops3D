import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uhi_monitoring/src/drawer/nss_alert.dart';
import 'package:uhi_monitoring/src/drawer/recomendation_engine.dart';
import 'package:uhi_monitoring/src/drawer/statistics.dart';
import 'package:uhi_monitoring/src/mapui.dart';

import 'drawer/satellitedata.dart';

class UhiWindow extends StatefulWidget {
  const UhiWindow({super.key, this.LatLng});
  final LatLng;

  @override
  _UhiWindowState createState() => _UhiWindowState();
}

class _UhiWindowState extends State<UhiWindow> {
  int index = 1; // State to track the selected page
  // Define a GlobalKey to access the ScaffoldState
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List of pages to render
  final List<Widget> pages = [
    Statistics(),
    // Add your satellite data widget here
    SatelliteData(),
    ParagraphPage(), // Recomendation engine page
    // Add your NSS Alert widget here
    NssAlert(),
    Statistics(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('UHI Detonator'),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 60,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.teal.shade200,
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Go to maps"), Icon(Icons.map)],
              ),
              onTap: () {
                Get.to(MapUI());
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Satellite data"), Icon(Icons.satellite_alt)],
              ),
              onTap: () {
                setState(() {
                  index = 1; // Update index to display Satellite data page
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recomendation engine"),
                  Icon(Icons.engineering_outlined)
                ],
              ),
              onTap: () {
                setState(() {
                  index =
                      2; // Update index to display Recomendation engine page
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("NSS Alert"), Icon(Icons.add_alert)],
              ),
              onTap: () {
                setState(() {
                  index = 3; // Update index to display NSS Alert page
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Statistics"),
                  Icon(Icons.data_thresholding_outlined)
                ],
              ),
              onTap: () {
                setState(() {
                  index = 4; // Update index to display NSS Alert page
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!
                  .closeDrawer(); // Close the drawer if it's open
            } else {
              _scaffoldKey.currentState!
                  .openDrawer(); // Open the drawer if it's closed
            }
          },
          color: Colors.white,
        ),
      ),
      body: pages[index], // Display the selected page
    );
  }
}
