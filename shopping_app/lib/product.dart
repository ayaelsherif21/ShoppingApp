import 'package:flutter/material.dart';
import 'card.dart';
import 'hot_offer.dart';

class ProductPage extends StatelessWidget {
  // List of products with unique images and texts
  final List<Map<String, String>> products = [
    {'image': 'assets/1.png', 'text': 'chair 1'},
    {'image': 'assets/2.png', 'text': 'chair 2'},
    {'image': 'assets/3.png', 'text': 'chair 3'},
    {'image': 'assets/4.png', 'text': 'chair 4'},
  ];

  // List of hot offer texts
  final List<String> hotOfferTexts = [
    'Exclusive offer for members only!',
    '50% off on all products!',
    'Buy 1 Get 1 Free on selected items!',
    'Flat 30% off on electronics!',
    'Limited time offer - Save Big!',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: ListView(
        children: [
          // 'Our Products' Section
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Our Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // PageView for product images with smaller height
          SizedBox(
            height: 400, // Adjust the height of the images here
            child: PageView(
              children: [
                Image.asset('assets/1.png',fit: BoxFit.cover ),
                Image.asset('assets/2.png',fit: BoxFit.cover),
                Image.asset('assets/3.png', fit: BoxFit.cover),
                Image.asset('assets/4.png', fit: BoxFit.cover),

              ],
            ),
          ),
          // GridView for product cards with unique images and texts
          Padding(
            padding: EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  image: products[index]['image']!,
                  text: products[index]['text']!,
                );
              },
            ),
          ),
          // 'Hot Offers' Section Title
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hot Offers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // ListView for hot offers
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: hotOfferTexts.length,
            itemBuilder: (context, index) {
              return HotOffer(
                text: hotOfferTexts[index],
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
