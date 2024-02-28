import 'package:flutter/material.dart';
import 'package:laundry_app/src/pages/phone_page.dart';
import 'package:laundry_app/src/pages/verify_page.dart';
import 'package:laundry_app/src/widgets/profile_page_widget.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Account Settings'),
          _buildListTile('Profile Information',
              onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageWidget()));
              }),
          _buildListTile('Change Password',
              onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPhone()));
              }),
          _buildSectionHeader('Notification Settings'),
          _buildListTile('Communication Preferences',
              onTap: () {}),
          _buildListTile('Notification Settings',
              onTap: () {}),
          _buildSectionHeader('Pickup and Delivery Preferences'),
          _buildListTile('Time Windows',
              onTap: () {}),
          _buildListTile('Delivery Instructions',
              onTap: () {}),
          _buildSectionHeader('Payment Settings'),
          _buildListTile('Payment Methods',
              onTap: () {}),
          _buildListTile('Billing Information',
              onTap: () {}),
          _buildSectionHeader('Order History and Tracking'),
          _buildListTile('Order History Settings',
              onTap: () {}),
          _buildListTile('Real-Time Tracking Preferences',
              onTap: () {}),
          _buildSectionHeader('Feedback and Ratings'),
          _buildListTile('Feedback Preferences',
              onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(String title, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: Icon(Icons.chevron_right),
    );
  }
}
