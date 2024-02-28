import 'package:flutter/material.dart';
import 'package:laundry_app/src/pages/help_page.dart';
import 'package:laundry_app/src/pages/home_page.dart';
import 'package:laundry_app/src/pages/notification_page.dart';
import 'package:laundry_app/src/pages/settings_page.dart';



class LaundryApp extends StatefulWidget {
  @override
  _LaundryAppState createState() => _LaundryAppState();
}

class _LaundryAppState extends State<LaundryApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: const HomeScreen(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF60948F)
            ),
            child: Column(
              children: [
                Align(
                  alignment : Alignment.topLeft,
                  child: Text(
                    'Laundry App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Text("data")
              ],
            ),
            
          ),
          
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle navigation to the home page or any other page
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Place Order'),
            onTap: () {
              // Handle navigation to the order placement page or any other page
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.history),
          //   title: Text('Order History'),
          //   onTap: () {
          //     // Handle navigation to the order history page or any other page
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {

              Navigator.push(context,MaterialPageRoute(builder: (context)=> NotificationPage()));

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            onTap: () {

              Navigator.push(context,MaterialPageRoute(builder: (context)=> FAQPage()));

            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {

              Navigator.pop(context);

            },
          ),
        ],
      ),
    );
  }
}
