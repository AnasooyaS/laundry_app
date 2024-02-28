import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:laundry_app/services/global.dart';
import 'package:laundry_app/src/pages/verify_page.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}


class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  Future<void> sendResetCode() async {
    final response = await http.post(
      Uri.parse('$baseURL/send-reset-code'),
      body: {'mobile_number': phoneController.text.trim()},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
    } else {
    }
  }

  Future<void> resetPasswordVerification(String resetCode) async {
    final response = await http.post(
      Uri.parse('$baseURL/reset-password-verification'),
      body: {'resetcode': resetCode},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

    } else {

    }
  }

  Future<void> resetPassword(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/reset-password'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
    } else {
    }
  }

  @override
  void initState() {
    super.initState();
  }
  int counter =60;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/phone.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Create a new password",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                     keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    await sendResetCode();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF88AB8E),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: const Text("Send OTP",
                  style: TextStyle(color: Colors.white),),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
