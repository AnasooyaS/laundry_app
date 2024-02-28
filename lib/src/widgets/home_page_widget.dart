import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {

    List<String> itemTexts = [
      'Wash and Fold',
      'Wash and Iron',
      'Premium Laundry',
      'Dry Clean',
      'Steam Press',
      'Starching',
      'Shoe Clean ',
      'Bag Clean',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1EB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Home Page",
                style: TextStyle(fontSize: 30),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFEEE7DA),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              ),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: itemTexts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridItemWidget(
                    text: itemTexts[index],
                    imageUrl: 'assets/img$index.png',
                    onPressed: () {
                      //_showDialog(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //       );
  //     },
  //   );
  // }

  void _showOtpDialog(
      BuildContext context, String fullName, String phoneNumber) {
    String enteredOtp = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 100,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AlertDialog(
              title: const Text('Enter OTP'),
              backgroundColor: const Color(0xFFabd4d1),
              content: Column(
                children: [
                  Text('Full Name: $fullName'),
                  Text('Phone Number: $phoneNumber'),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter OTP...',
                    ),
                    onChanged: (value) {
                      enteredOtp = value;
                    },
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    print('Entered OTP: $enteredOtp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF60948F),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: const Text(
                    'Submit OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback onPressed;

  const GridItemWidget({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE3F5FB),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
           const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF60948F),
              shape: const BeveledRectangleBorder(),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        //constraints: const BoxConstraints(maxWidth: 200.0, maxHeight: 200.0),
      ),
    );

  }
}
