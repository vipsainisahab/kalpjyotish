import 'package:new_astro/widgets/custom_btn.dart';
import 'package:new_astro/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String _selectedOption = "Feedback"; // Default selection
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _issueTypeController = TextEditingController();
  final TextEditingController _suggestionBoxController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _contactNumberController.dispose();
    _subjectController.dispose();
    _issueTypeController.dispose();
    _suggestionBoxController.dispose();
    super.dispose();
  }

  Widget _buildFeedbackForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Email"),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
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
        CustomText(text: "I suggest you"),
        TextField(
          controller: _suggestionBoxController,
          decoration: InputDecoration(
            labelText: 'I suggest you',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Suggestion Box"),
        TextField(
          controller: _suggestionBoxController,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Suggestion Box',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildContactSupportForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Email"),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
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
        CustomText(text: "Subject"),
        TextField(
          controller: _subjectController,
          decoration: InputDecoration(
            labelText: 'Subject',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Issue Type"),
        TextField(
          controller: _issueTypeController,
          decoration: InputDecoration(
            labelText: 'Issue Type',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        CustomText(text: "Suggestion Box"),
        TextField(
          controller: _suggestionBoxController,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Suggestion Box',
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
        backgroundColor: ColorResources.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Type"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RadioListTile(
                    value: "Feedback",
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                    title: Text('Feedback'),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: "Contact Support",
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                    title: Text('Contact Support'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: _selectedOption == "Feedback"
                    ? _buildFeedbackForm()
                    : _buildContactSupportForm(),
              ),
            ),
            SizedBox(height: 16),
            CustomButton(text: "Submit",  onPressed: () {
              // Submit button action
              if (_selectedOption == "Feedback") {
                print('Feedback submitted: ${_emailController.text}');
              } else {
                print('Contact Support submitted: ${_subjectController.text}');
              }
            }, backgroundColor: ColorResources.primaryColor,),

          ],
        ),
      ),
    );
  }
}
