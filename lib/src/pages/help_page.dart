import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'What is the usual turnaround time?',
      'answer': 'We take 24to 72 hours depending on the services, you are looking for.You can also opt for express delivery in case of emergency.',
    },
    {
      'question': 'What is the minimum order value?',
      'answer': 'Our minimum order value is RS.250.You can also visit our live laundry and dry clean store to avoid minimum order amount.',
    },
    {
      'question':'How do i give special instructions for my service?',
      'answer':'We take necessary input/instructions from you while you book a service from our app .We inform you at the point of booking the order if that is possible for us.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(faqs[index]['question']!,style: const TextStyle(color: Colors.black)),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(faqs[index]['answer']!),
                    ),
                  ],
                );
              },
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text('Contact: 123-456-7890',style: TextStyle(color: Colors.black87,
            ),),
          ),
          //  Divider(),
          const Align(
            alignment: Alignment.center,
            child: Text('Email: support@example.com',style: TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}