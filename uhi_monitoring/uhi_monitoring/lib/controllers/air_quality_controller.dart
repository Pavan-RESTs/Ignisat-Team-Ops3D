import 'package:get/get.dart';

import '../helper_functions/api.dart';

class MapController extends GetxController {
  var isLoading = false.obs;
  var data = <String, String>{}.obs;

  Future<void> fetchData(double latitude, double longitude) async {
    isLoading(true); // Show spinner
    try {
      data.value = await API.getCurrentConditions(
        "AIzaSyDYqPV7TNUiOKI5R1ejqQ4ZiwNw1qSF7kU",
        latitude,
        longitude,
      );
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading(false); // Hide spinner
    }
  }
}
