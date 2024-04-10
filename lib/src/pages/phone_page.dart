import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laundry_app/services/global.dart';
import 'package:laundry_app/src/pages/login_page.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController emailController = TextEditingController();

  Future<void> sendResetCode() async {
    final String email = emailController.text.trim();

    if (email.isEmpty) {
      print('enter email and password');
      return;
    }

    final response = await http.post(
        Uri.parse('$baseURL/send-reset-code'),
        body: {
          'email': email,
        },
        headers: {
          'Accept':'application/json'
        }
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => VerifyResetCodeScreen(email),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    } else {
      // Handle failure
      print(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  int counter = 60;
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
                height: 40,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(
                        child: TextField(
                          controller: emailController,
                     keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
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
                    onPressed: ()  {
                       sendResetCode();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF88AB8E),
                      shape: const BeveledRectangleBorder(),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
class VerifyResetCodeScreen extends StatefulWidget {
  final String email;

  const VerifyResetCodeScreen(this.email, {super.key});

  @override
  _VerifyResetCodeScreenState createState() => _VerifyResetCodeScreenState();
}

class _VerifyResetCodeScreenState extends State<VerifyResetCodeScreen> {
  final TextEditingController _resetCodeController = TextEditingController();

  Future<void> verifyResetCode() async {
    final String resetCode = _resetCodeController.text.trim();

    if (resetCode.isEmpty) {
      // Handle empty reset code
      return;
    }

    final response = await http.post(
      Uri.parse('$baseURL/verify-reset-code'),
      body: {
        'email': widget.email,
        'reset_code': resetCode,
      },
    );

    if (response.statusCode == 200) {

      print('Reset code verified successfully');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordScreen(widget.email)),
      );
    } else {

      print('Failed to verify reset code');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 150,),
              Image.asset(
                'assets/rotate.png',
                width: 50,
                height: 150,
              ),
              const SizedBox(height: 70.0),
              TextFormField(
                controller: _resetCodeController,
                decoration: const InputDecoration(labelText: 'Enter Reset Code'),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 50,
                width: 340,
                child: ElevatedButton(onPressed: (){
                  verifyResetCode();
                },
                  style: ElevatedButton.styleFrom(
                     backgroundColor: const Color(0xFF88AB8E),
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text('Verify'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen(this.email, {super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: const Text('Password reset successfully!'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    final String password = _passwordController.text.trim();
    final String confirmPassword = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      return;
    }

    if (password != confirmPassword) {
      print('Password and Confirm Password do not match');
      return;
    }

    final response = await http.post(
      Uri.parse('$baseURL/reset-password'),
      body: {
        'email': widget.email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print('Password reset successfully');
      showSuccessSnackbar(context);

    } else {
      print('Failed to reset password');
      print(response.body);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Reset Password',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 170),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(onPressed: (){
                resetPassword();
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF88AB8E),
                  shape: RoundedRectangleBorder(),
                ),
                child: const Text('Reset Password'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
