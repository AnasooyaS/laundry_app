import 'package:flutter/material.dart';
import 'package:laundry_app/src/pages/order_summary.dart';

class ReviewPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<ReviewPage> {
  bool isHeavyItemsSelected = false;
  int numberOfClothes = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Any pickup instructions for rider?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: ''),
              ),
              const SizedBox(height: 20),
              const Text(
                'Number of Clothes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: numberOfClothes.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    numberOfClothes = value.round();
                  });
                },
                min: 1,
                max: 100,
                divisions: 99,
                label: numberOfClothes.toString(),
              ),
              Text('Selected: $numberOfClothes'),
              if (_formKey.currentState != null &&
                  numberOfClothes < 1)
                Text(
                  'Please select at least 1 clothes',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Heavy Items',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: isHeavyItemsSelected,
                      onChanged: (bool value) {
                        setState(() {
                          isHeavyItemsSelected = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BookingDetails bookingDetails = BookingDetails(
                        name: 'John Doe',
                        address: '123 Main St',
                        mobileNumber: '123-456-7890',
                        clothesDetails: 'Shirts, Pants',
                        numberOfClothes: numberOfClothes,
                        price: 50.0,
                        gst: 5.0,
                        totalPrice: 55.0,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSummaryPage(bookingDetails: bookingDetails),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF88AB8E),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: const Text(
                    'Continue with Payment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

