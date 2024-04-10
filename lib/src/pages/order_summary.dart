import 'package:flutter/material.dart';
import 'package:laundry_app/src/pages/razorpay_page.dart';

class BookingDetails {
  String name;
  String address;
  String mobileNumber;
  String clothesDetails;
  int numberOfClothes;
  double price;
  double gst;
  double totalPrice;

  BookingDetails({
    required this.name,
    required this.address,
    required this.mobileNumber,
    required this.clothesDetails,
    required this.numberOfClothes,
    required this.price,
    required this.gst,
    required this.totalPrice,
  });
}

class OrderSummaryPage extends StatelessWidget {
  final BookingDetails bookingDetails;

  OrderSummaryPage({required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${bookingDetails.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Address: ${bookingDetails.address}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Mobile Number: ${bookingDetails.mobileNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Clothes Details: ${bookingDetails.clothesDetails}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Number of Clothes: ${bookingDetails.numberOfClothes}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Price: ${bookingDetails.price}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'GST: ${bookingDetails.gst}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total Price: ${bookingDetails.totalPrice}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RazorPayPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF88AB8E),
                shape: BeveledRectangleBorder(),
              ),
              child: const Text(
                'Confirm Order',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
