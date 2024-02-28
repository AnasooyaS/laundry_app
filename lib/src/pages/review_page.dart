import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<ReviewPage> {
  bool isHeavyItemsSelected = false;
  int numberOfClothes = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Any pickup instructions for rider?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: ''),
            ),
            SizedBox(height: 20),
            Text(
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
              divisions: 9,
              label: numberOfClothes.toString(),
            ),
            Text('Selected: $numberOfClothes'),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
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
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _showPhoneNumberBottomSheet();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF88AB8E),
                  shape: const BeveledRectangleBorder(),
                ),
                child: Text(
                  'Continue with PhoneNumber',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPhoneNumberBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter Phone Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {

                  print('Sending OTP...');
                },
                style:  ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF88AB8E),
               shape: const BeveledRectangleBorder(),
        ),
                child: Text('Send OTP',
                style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style:  ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF88AB8E),
                  shape: const BeveledRectangleBorder(),
                ),
                child: Text('Close',
                style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }
}
