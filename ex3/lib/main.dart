import "package:flutter/material.dart";

enum Product {
  dart("assets/dart.png", "Dart", "The best object language"),
  flutter("assets/flutter.png", "Flutter", "The best widget library"),
  firebase("assets/firebase.png", "Firebase", "The best cloud database");

  final String image;
  final String title;
  final String description;

  const Product(this.image, this.title, this.description);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Products")),
        body: Container(
          color: Colors.blue,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ProductCard(productType: Product.dart),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ProductCard(productType: Product.flutter),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ProductCard(productType: Product.firebase),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product productType;
  const ProductCard({super.key, required this.productType});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Image(
              image: AssetImage(productType.image),
              width: 100,
              height: 100,
            ),
            Text(
              productType.title,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(productType.description),
          ],
        ),
      ),
    );
  }
}
