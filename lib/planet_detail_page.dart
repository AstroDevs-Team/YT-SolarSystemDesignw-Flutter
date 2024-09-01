import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PlanetDetailPage extends StatelessWidget {
  final Map<String, dynamic> planet;
  const PlanetDetailPage({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              planet['planetName'].toUpperCase(),
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              planet['nickName'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: height * 0.25,
                  width: width,
                  child: Image.asset(
                    "assets/images/${planet['imagePath']}",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: height * 0.01,
                  right: width * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.transparent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: height * 0.08,
                              height: height * 0.08,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.thermostat,
                                  color: Colors.white,
                                ),
                                Text(
                                  planet['temperature'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Distance From Earth",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              planet["distanceToEarth"].toString().toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.vpn_lock_outlined,
                  color: Colors.grey.withOpacity(0.8),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.grey.withOpacity(0.8),
                ),
                DottedLine(
                  lineLength: width * 0.7,
                  direction: Axis.horizontal,
                  dashColor: Colors.grey.withOpacity(0.8),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            PlanetDetailItem(
                icon: Icons.speed,
                title: "Average Orbital Speed",
                values: planet["averageOrbitalSpeed"]),
            PlanetDetailItem(
                icon: Icons.satellite_alt,
                title: "Satellites",
                values: planet["satellitesSent"].toString()),
            PlanetDetailItem(
                icon: Icons.architecture_sharp,
                title: "Surface Area",
                values: planet["surfaceArea"]),
            PlanetDetailItem(
                icon: Icons.rotate_right_outlined,
                title: "Rotation Period",
                values: "${planet["rotationPeriod"]} d")
          ],
        ),
      ),
    );
  }
}

class PlanetDetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String values;
  const PlanetDetailItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.values});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      width: width,
      height: height * 0.08,
      decoration: BoxDecoration(
        color: Colors.blue[900]!.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: height * 0.04,
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                values,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
