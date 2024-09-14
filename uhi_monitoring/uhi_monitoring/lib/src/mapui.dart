import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uhi_monitoring/data/polygon_data.dart';
import 'package:uhi_monitoring/src/uhi_window.dart';

import '../controllers/air_quality_controller.dart';
import '../custom_widgets/air_quality_card.dart';

class MapUI extends StatefulWidget {
  const MapUI({super.key});

  @override
  _MapUIState createState() => _MapUIState();
}

class _MapUIState extends State<MapUI> {
  bool isAlertOpen1 = false;
  bool isAlertOpen2 = false;
  GoogleMapController? _controller;
  final MapController _mapController = Get.put(MapController());

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    try {
      String style = await rootBundle.loadString('assets/mapTheme.json');
      _controller?.setMapStyle(style);
    } catch (e) {
      print("Error loading map style: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (position) async {
              if (isAlertOpen1 == false && isAlertOpen2 == false ||
                  isAlertOpen1 == false) {
                await _mapController.fetchData(
                  position.latitude,
                  position.longitude,
                );
                _showAlertDialog1(context, position);
              }
              isAlertOpen1 = !isAlertOpen1;
            },
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(11.940441400352215, 79.81188049716283),
              zoom: 13.8,
            ),
            polygons: {
              Polygon(
                onTap: () {},
                polygonId: const PolygonId('polygon1'),
                points: PolygonData.polygon1,
                strokeColor: Colors.orange,
                strokeWidth: 1,
                fillColor: Colors.cyanAccent.withOpacity(0.2),
              ),
              Polygon(
                onTap: () {
                  Get.to(UhiWindow());
                },
                polygonId: const PolygonId('polygon2'),
                points: PolygonData.polygon2,
                strokeColor: Colors.red,
                strokeWidth: 1,
                fillColor: Colors.red.withOpacity(0.4),
              ),
              Polygon(
                onTap: () {},
                polygonId: const PolygonId('polygon3'),
                points: PolygonData.polygon3,
                strokeColor: Colors.yellowAccent,
                strokeWidth: 1,
                fillColor: Colors.yellowAccent.withOpacity(0.2),
              ),
              Polygon(
                onTap: () {},
                polygonId: const PolygonId('polygon4'),
                points: PolygonData.polygon4,
                strokeColor: Colors.green,
                strokeWidth: 1,
                fillColor: Colors.green.withOpacity(0.4),
              ),
            },
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _loadMapStyle();
            },
          ),
          Obx(() {
            if (_mapController.isLoading.value) {
              return const Center(
                child: SpinKitWave(color: Colors.cyanAccent),
              );
            }
            return SizedBox.shrink();
          }),
          const Positioned(
            bottom: 30,
            right: 30,
            child: ColorBar(),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog1(BuildContext context, LatLng position) {
    Alert(
      padding: EdgeInsets.symmetric(horizontal: 32),
      context: context,
      content: AirQualityCard(data: _mapController.data),
      style: AlertStyle(
        backgroundColor: Colors.black45,
      ),
      buttons: [
        DialogButton(
          color: Colors.white54.withOpacity(0.2),
          child: Text(
            "Close",
            style: TextStyle(color: Colors.teal.shade200),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ).show();
  }
}

class ColorBar extends StatelessWidget {
  const ColorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 200,
      color: Colors.white24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 25,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00FFFF),
                  Color(0xFF35DD91),
                  Color(0xFFFFFF00),
                  Color(0xFFCF8C34),
                  Color(0xFFEF7538),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("- 37°C", style: TextStyle(color: Colors.white)),
              Text("- 34°C", style: TextStyle(color: Colors.white)),
              Text("- 30°C", style: TextStyle(color: Colors.white)),
              Text("- 26°C", style: TextStyle(color: Colors.white)),
              Text("- 22°C", style: TextStyle(color: Colors.white)),
              Text("- 18°C", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
