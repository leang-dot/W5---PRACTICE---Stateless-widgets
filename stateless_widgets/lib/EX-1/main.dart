
import 'package:flutter/material.dart';
import '../appBar.dart';

class EX1 extends StatelessWidget {
  const EX1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar('My Hobbies'),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: [
              HobbyCard(title: 'Travel', iconData: Icons.travel_explore, color: Colors.green,),
              HobbyCard(title: 'Skating', iconData: Icons.skateboarding, color: Colors.blueGrey,)
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.title,
    required this.iconData,
    this.color = Colors.blue,
  });

  final String title;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 20,
                top: 30,
                bottom: 30,
              ),
              child: Icon(iconData, color: Colors.white,),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
