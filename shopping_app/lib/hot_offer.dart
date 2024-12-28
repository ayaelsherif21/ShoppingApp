import 'package:flutter/material.dart';

class HotOffer extends StatelessWidget {
  final String text;
  final int index;

  HotOffer({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: Row(
          children: [
            // Expanded widget for the image
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/hot-deal.png',
                height: 100,
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.0), // Spacing between image and text
            // Expanded widget for the text
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hot Offer $index',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text,  // Display different text for each offer
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
