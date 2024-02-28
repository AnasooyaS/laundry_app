import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:laundry_app/services/auth_service.dart';
import 'package:laundry_app/src/pages/home_page.dart';
import 'package:laundry_app/src/pages/phone_page.dart';
import 'package:laundry_app/src/pages/sigup_page.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  _signIn()async{
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if(email.isNotEmpty&&password.isNotEmpty){
      http.Response response = await AuthService.login(email, password);
      if(response.statusCode == 200){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text( 'Successfully Logined'),
            )
        );
      }else{
        print('Failed');
      }

    }else{
      print('email and password required');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text( 'Enter email and password'),
          )
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('The Crisp Cleaners'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/app.jpg',
                ),
                TextFormField(
                  autofillHints: [AutofillHints.email],
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Username/Email',
                    filled: true,
                    fillColor: Color(0xFFE7EFE9),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },

                ),


                const SizedBox(height: 20.0),
                TextFormField(
                  autofillHints: [AutofillHints.password],
                  controller: _passwordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: const Color(0xFFE7EFE9),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      iconSize: 22.0,
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPhone()),
                      );
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                    _signIn();
                    _emailController.clear();
                    _passwordController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF88AB8E),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: const Text(
                      "Create a new account",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
