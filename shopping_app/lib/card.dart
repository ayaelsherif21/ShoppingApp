import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String text;

  ProductCard({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              // Show a snackbar when the "Add to Cart" button is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$text added to cart')),
              );
            },
          ),
        ],
      ),
    );
  }
}
