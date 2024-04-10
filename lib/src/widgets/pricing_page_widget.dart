import 'package:flutter/material.dart';

import '../pages/slot_page.dart';

class PricingPageWidget extends StatelessWidget {
  final List<String> images = [
    'wgt.jpeg', 'shirt.jpeg', 't-shirt.jpeg',
    'jack.jpg','trousers.jpeg','sherwani.webp','Quilt.jpeg',
    'saree.jpeg','lehe.jpeg','shoe.jpeg','coat.jpeg',
    'blanket.jpeg','purse.jpeg','troll.jpg','pack.jpeg','bed.jpeg',
    'curtain.jpg','tab.jpg','cushion.jpg','carpet.jpeg',
    'grwn.jpeg','hat.jpeg',


  ];

  final List<String> text = [
    'Wash&Fold', 'Shirt', 'T-shirt',
    'Blazers/Jackets','Trousers/Jeans','Sherwani','Qiilt',
    'Saree','Lehenga','Shoe','Overcoat',
    'Blanket','Purse','Trolley','BackPack','Pillow and Bedsheet',
    'Curtain Panel','Table Cloth','Cushion','Carpet and Mat',
    'Grown/Anarkali','Hat','Kurta',

  ];

  PricingPageWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa6bdb3),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TextButton(
            style: ButtonStyle(
              alignment: Alignment.centerRight
            ),

            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => LaundryBookingPage()));

            },

            child: Text(
              'Book Now',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 23,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/${images[index % images.length]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            children: [

                              Text(
                                text[index % text.length],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
