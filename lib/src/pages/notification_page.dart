import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildNotificationCard(
            title: 'Order Status Update',
            message: 'Your laundry order is now out for delivery.',
            icon: Icons.shopping_cart,
            color: Colors.lightBlueAccent,
          ),
          _buildNotificationCard(
            title: 'Delivery Alert',
            message: 'Our delivery person is on the way to pick up your laundry.',
            icon: Icons.directions_bike,
            color: Colors.lightGreen,
          ),
          _buildNotificationCard(
            title: 'Payment Reminder',
            message: 'Your payment for laundry services is due tomorrow.',
            icon: Icons.payment,
            color: Colors.orange,
          ),
          _buildNotificationCard(
            title: 'Subscription Renewal Alert',
            message: 'Your laundry subscription will renew in 3 days.',
            icon: Icons.autorenew,
            color: Colors.purpleAccent,
          ),
          _buildNotificationHistory(),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({required String title, required String message, required IconData icon, required Color color}) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40.0,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(message),
        onTap: () {
          // Handle tapping on the notification card
        },
      ),
    );
  }

  Widget _buildNotificationHistory() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        SizedBox(height: 16.0),
    Text(
    'Notification History',
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    Divider(),
    ListTile(
    title: Text('No new notifications'),
    subtitle: Text('You are all caught up!'),
    ),
    // Add more notification history items as needed
    ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationPage(),
  ));
}
