import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageWidget extends StatefulWidget {
  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  Uint8List? _imageBytes;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/app.jpg'),

            const Text("Profile",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),

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

            ElevatedButton(
              onPressed:() => _pickImage(ImageSource.gallery),
              child: const Text('Pick Image'),
            ),
            if (_imageBytes != null) Image.memory(_imageBytes!),

            const SizedBox(height: 20.0),
            TextFormField(
              initialValue: '',
              decoration: const InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: '',
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: '',
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: '',
              decoration: const InputDecoration(
                  labelText: 'Address',
                  filled: true,
                  fillColor: Color(0xFFE7EFE9)
              ),
            ),
            const SizedBox(height: 20.0),
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

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }
}
