import 'package:flutter/material.dart';
import 'package:stateless_widgets/appBar.dart';

enum WeatherType {
  sunny(title: 'Sunny', imagePath: 'assets/ex4/sunny.png'),
  cloudy(title: 'Cloudy', imagePath: 'assets/ex4/cloudy.png'),
  sunnyCloudy(title: 'sunnyCloudy', imagePath: 'assets/ex4/sunnyCloudy.png'),
  veryCLoudy(title: 'veryCloudy', imagePath: 'assets/ex4/verCloudy.png');

  final String title;
  final String imagePath;

  const WeatherType({required this.title, required this.imagePath});
}

class EX4 extends StatelessWidget {
  const EX4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Weather Forecast'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          WeatherCard(
            city: "Phnom Penh",
            current: 12.2,
            min: 10,
            max: 30,
            weatherType: WeatherType.sunny,
            colors: [Colors.purple, Colors.deepPurple],
          ),
          SizedBox(height: 20),
          WeatherCard(
            city: "Paris",
            current: 22.2,
            min: 10,
            max: 40,
            weatherType: WeatherType.cloudy,
            colors: [Colors.greenAccent, Colors.green],
          ),
          SizedBox(height: 20),
          WeatherCard(
            city: "Rome",
            current: 45.2,
            min: 10,
            max: 40,
            weatherType: WeatherType.sunny,
            colors: [Colors.pinkAccent, Colors.pink],
          ),
          SizedBox(height: 20),
          WeatherCard(
            city: "Toulouse",
            current: 45.2,
            min: 10,
            max: 40,
            weatherType: WeatherType.sunnyCloudy,
            colors: [Colors.orange, Colors.deepOrange],
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double current;
  final int min;
  final int max;
  final WeatherType weatherType;
  final List<Color> colors;

  const WeatherCard({
    super.key,
    required this.city,
    required this.current,
    required this.min,
    required this.max,
    required this.weatherType,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.black26,
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(minHeight: 120),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        weatherType.imagePath,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Min $min°C",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Max $max°C",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${current.toStringAsFixed(1)}°C",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
                
              ),
            ),
            Positioned(
              right: -40,
              bottom: -20,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
