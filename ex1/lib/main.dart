import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: HobbiesScreen(),
      ),
    );
  }
}

class HobbiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HobbyCard(
            hobbyTitle: 'Travelling',
            hobbyIcon: Icons.flight_takeoff,
            backgroundColor: Colors.green,
          ),
          SizedBox(height: 12),
          HobbyCard(
            hobbyTitle: 'Skating',
            hobbyIcon: Icons.skateboarding,
            backgroundColor: Colors.grey,
          ),
          SizedBox(height: 12),
          HobbyCard(hobbyTitle: 'Reading', hobbyIcon: Icons.book),
        ],
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  String hobbyTitle;
  IconData hobbyIcon;
  Color backgroundColor;

  HobbyCard({
    Key? key,
    required this.hobbyTitle,
    required this.hobbyIcon,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),

      child: Center(
        child: Row(
          children: [
            Icon(hobbyIcon, color: Colors.white, size: 24),
            Text(
              hobbyTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
