import 'package:flutter/material.dart';

class InvitePageWidget extends StatefulWidget {
  const InvitePageWidget({Key? key});

  @override
  State<InvitePageWidget> createState() => _InvitePageWidgetState();
}

class _InvitePageWidgetState extends State<InvitePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/img.jpg'),
              const SizedBox(height: 20),

              const Text(
                '''Refer and earn Upto FC 5000 
Invite your friends to Fabrico App. They get FC 50. You win upto FC 5000.

Details

                For a limited time, invite anyone to Fabrico and if their first order is delivered, you will get FC 100 and they'll get FC 50 instantly.

                Here's how you get a friend on board:

                Send your invite link https://fabrico.onelink.me/ 2CVN/dev so they can download Fabrico App.

                • They must enter in your referral code during signup.

                • You will get FC 100 after their order is processed. They will instantly get FC 50.

                Terms & Conditions

                • Your friend must not have registered with us before.

                • The phone number which your friend will use to sign up shouldn't have been used Fabrico Services before.

                • Fabrico App should not be installed using App runtime for Chrome, emulators or simulators.

                • It is only for the users based in India. The mobile number provided to receive OTP should be an Indian mobile number.

                • If your friend uses someone else's referral code, the person whose referral code is used will get the benefits even if you had referred him/her first.
                ''',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
