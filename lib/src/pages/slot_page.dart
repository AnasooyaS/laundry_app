import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app/src/pages/review_page.dart';

class LaundryBookingPage extends StatefulWidget {
  @override
  _LaundryBookingPageState createState() => _LaundryBookingPageState();
}

class _LaundryBookingPageState extends State<LaundryBookingPage> {
   DateTime? selectedPickupDate;
  DateTime? selectedPickupTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'When would you like your clothes to be picked up?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              _buildDateTimePicker(
                selectedDate: selectedPickupDate,
                onChanged: (date) {
                  setState(() {
                    selectedPickupDate = date;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'At what time should the rider arrive?',
                style: TextStyle(fontSize: 18),
              ),
          
              
              SizedBox(height: 10),
              _buildDateTimePicker(
                selectedDate: selectedPickupTime,
                dateOnly: false,
                onChanged: (time) {
                  setState(() {
                    selectedPickupTime = time;
                  });
                },
              ),
              SizedBox(height: 350,),
          
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReviewPage()),
                    );
          
                    print('Button pressed!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF88AB8E),
                    shape: const BeveledRectangleBorder(),
                  ),
                  child: Text('Continue',
                  style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimePicker({
    DateTime? selectedDate,
    bool dateOnly = true,
    Function(DateTime?)? onChanged,
  }) {
    return DateTimeField(
      format: dateOnly ? DateFormat("yyyy-MM-dd") : DateFormat("hh:mm a"),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color(0xffE7EFE9),
      ),
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2101),
        );
        if (date != null && !dateOnly) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(
              currentValue ?? DateTime.now(),
            ),
          );
          return DateTimeField.combine(date, time);
        } else {
          return date;
        }
      },
      onChanged: onChanged,
    );
  }
}
