import 'package:flutter/material.dart';
import 'package:laundry_app/components/app_drawer.dart';
import 'package:laundry_app/services/global.dart';
import 'package:laundry_app/src/pages/settings_page.dart';
import 'package:laundry_app/src/widgets/home_page_widget.dart';
import 'package:laundry_app/src/widgets/invite_page_widget.dart';
import 'package:laundry_app/src/widgets/pricing_page_widget.dart';
import 'package:laundry_app/src/widgets/profile_page_widget.dart';
import 'package:http/http.dart'as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  final List<Widget> pages = [
    HomePageWidget(),
    PricingPageWidget(),
    InvitePageWidget(),
    ProfilePageWidget()
  ];
  Future<void> logout() async {
    final response = await http.post(
      Uri.parse('$baseURL/logout'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Handle successful logout
      print('Logged out successfully');
      Navigator.of(context).pop();

    } else {
      print('Logout failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1EB),
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'The Crisp Cleaners',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  const PopupMenuItem(
                    value: 'option1',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(
                    value: 'option2',
                    child: Text('Profile'),

                  ),
                  const PopupMenuItem(
                    value: 'option3',
                    child: Text('Logout'),


                  ),
                ],
              ).then((value) {
                if (value != null) {
                  handleMenuItem(value);
                }
              });
            },
          ),
        ],
      ),
      body: pages[myIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items:  [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/price.png', width: 24, height: 24),
            label: 'Pricing',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/invite.png', width: 24, height: 24),
            label: 'Invite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/profile.png', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFF60948F),
        unselectedItemColor: Colors.grey,
      ),
    );

  }
  void handleMenuItem(String value) {
    switch (value) {
      case 'option1':
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
        break;

      case 'option2':
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageWidget()));

        print('Option 2 selected');
        break;

        default:
          logout();
        print('logout option selected');
    }
  }
}
