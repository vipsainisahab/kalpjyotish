import 'package:new_astro/utils/color_resource.dart';
import 'package:new_astro/widgets/custom_btn.dart';
import 'package:new_astro/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class KundliScreen extends StatefulWidget {
  @override
  _KundliScreenState createState() => _KundliScreenState();
}

class _KundliScreenState extends State<KundliScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _dateOfMonthController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressBoxController = TextEditingController();
  final TextEditingController _hrsController = TextEditingController();

  String _selectedOption = "Feedback"; // Default radio button selection

  @override
  void dispose() {
    _emailController.dispose();
    _contactNumberController.dispose();
    _dateOfMonthController.dispose();
    _dobController.dispose();
    _addressBoxController.dispose();
    _hrsController.dispose();
    super.dispose();
  }

  Widget _buildKundliForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Name"),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Contact Number"),
        TextField(
          controller: _contactNumberController,
          decoration: InputDecoration(
            labelText: 'Contact Number',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Date of Month"),
        TextField(
          controller: _dateOfMonthController,
          decoration: InputDecoration(
            labelText: 'Date of Month',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Date of Birth"),
        TextField(
          controller: _dobController,
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Gender:"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              child: RadioListTile(
                value: "Male",
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                title: Text('Male'),
              ),
            ),
            Expanded(
              child: RadioListTile(
                value: "Female",
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
                title: Text('Female'),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        CustomText(text: "Address"),
        TextField(
          controller: _addressBoxController,
          maxLines: 2,
          decoration: InputDecoration(
            labelText: 'Address',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "HRS"),
        TextField(
          controller: _hrsController,
          decoration: InputDecoration(
            labelText: 'HRS',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback & Support'),
        backgroundColor: ThemeColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: _buildKundliForm(),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: CustomButton(
                text: "Submit",
                onPressed: () {
                  // Submit button action
                  if (_selectedOption == "Feedback") {
                    print('Feedback submitted: ${_emailController.text}');
                  } else {
                    print('Contact Support submitted: ${_emailController.text}');
                  }
                },
                backgroundColor: ThemeColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
