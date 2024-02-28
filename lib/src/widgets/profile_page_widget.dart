
import 'package:flutter/material.dart';

class ProfilePageWidget extends StatefulWidget {
  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/app.jpg'),

            Text("Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),

            CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/Anas.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(child: IconButton(
              onPressed:(){} ,
              icon: const Icon(Icons.add_a_photo),
            ),


            ),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(
                labelText: 'Name',

                filled: true,
                fillColor: Color(0xFFE7EFE9)
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              initialValue: '',
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',

                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              initialValue: '',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',

                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(
                labelText: 'Address',

                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF88AB8E),
                shape: const BeveledRectangleBorder(),
              ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white),
                )
            ),
          ],
        ),
      ),
    );
  }
}
