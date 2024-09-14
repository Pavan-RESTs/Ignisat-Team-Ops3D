import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:uhi_monitoring/src/mapui.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  static String background = "assets/images/lightbluebackground.jpg";
  static Color bgcolor = Colors.black;
  static Color textcolor = Colors.white;
  // var isSliderOpen = false.obs;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(),
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/Images/logooo.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                    width: 700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NavigationButton(text: "Home", function: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        NavigationButton(text: "Map View", function: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        NavigationButton(
                            text: "Satellite Data", function: () {}),
                        SizedBox(
                          width: 10,
                        ),
                        NavigationButton(
                            text: "Regional Alerts", function: () {}),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.teal.shade300),
                          ),
                          onPressed: () {},
                          child: Text(
                            "About us?",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.teal.shade300),
                        ),
                        onPressed: () {
                          setState(() {
                            if (bgcolor == Colors.black) {
                              bgcolor = Colors.white;
                            } else {
                              bgcolor = Colors.black;
                            }

                            if (textcolor == Colors.white) {
                              textcolor = Colors.black;
                            } else {
                              textcolor = Colors.white;
                            }
                          });
                        },
                        child: Text(
                          "🌙",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Column(
              children: [
                WelcomeCard(textcolor: textcolor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
    required this.textcolor,
  });

  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            "HEATSCAPE TECHNOLOGY",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade300,
              fontSize: 50,
              // shadows: [
              //   Shadow(
              //     blurRadius: 5.0, // Adjust the blur radius to control the glow size
              //     color: Colors.white,
              //     offset: Offset(0, 0), // Keep the offset at (0,0) for a centered glow
              //   ),
              // ],
            ),
          ),
          Text(
            "Urban Heat Island Maintainance Service",
            style: GoogleFonts.pacifico(
              color: textcolor,
              fontSize: 30,
            ),
          ),
          InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.teal.shade300,
              onTap: () {
                Get.to(MapUI());
              },
              child:
                  Lottie.asset('lottie/earthv2.json', height: 250, width: 250)),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 30,
              width: 120,
              color: Colors.teal.shade300,
              child: Center(
                  child: Text(
                "Overview",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "A comprehensive application which identifies the Urban Heat Island, evaluating the UHI Index\n"
            "Thereby providing insights about the UHI Regions and measures to reduce the Impact of Heat\n"
            "Monitoring of your input regional data by analyzing the aerial data through our SATELLITE",
            style: GoogleFonts.montserrat(
              color: textcolor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.teal.shade300),
        ),
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ));
  }
}
