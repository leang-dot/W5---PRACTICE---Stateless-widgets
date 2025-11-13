import "package:flutter/material.dart";

enum Weather {
  cloudy(
    "assets/cloudy.png",
    "PhnomPenh",
    "10.0°C",
    "30.0°C",
    "12.2°C",
    Colors.cyan,
    Colors.orange,
  ),
  sunny(
    "assets/sunny.png",
    "Paris",
    "10.0°C",
    "40.0°C",
    "22.2°C",
    Colors.deepPurple,
    Colors.deepOrange,
  ),
  sunnyCloudy(
    "assets/sunnyCloudy.png",
    "Rome",
    "10.0°C",
    "40.0°C",
    "45.2°C",
    Colors.red,
    Colors.amber,
  ),
  veryCloudy(
    "assets/veryCloudy.png",
    "Toulouse",
    "10.0°C",
    "40.0°C",
    "45.2°C",
    Colors.green,
    Colors.indigo,
  );

  final String image;
  final String min;
  final String max;
  final String currentTemp;
  final String city;
  final Color fromColor;
  final Color toColor;

  const Weather(
    this.image,
    this.city,
    this.min,
    this.max,
    this.currentTemp,
    this.fromColor,
    this.toColor,
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xFF4CA1AF), Color(0xFF2C3E50)],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 30,
            children: [
              CustomWeather(weatherType: Weather.cloudy),
              CustomWeather(weatherType: Weather.sunny),
              CustomWeather(weatherType: Weather.sunnyCloudy),
              CustomWeather(weatherType: Weather.veryCloudy),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWeather extends StatelessWidget {
  Weather weatherType;

  CustomWeather({required this.weatherType, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Card(
          shadowColor: Colors.black,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [weatherType.fromColor, weatherType.toColor],
              ),
            ),
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(weatherType.image),
                          backgroundColor: Colors.white,
                          radius: 40,
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.all(5),
                                child: Text(
                                  weatherType.city,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                weatherType.min,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                weatherType.max,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    weatherType.currentTemp,
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
