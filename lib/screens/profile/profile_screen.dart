import 'package:new_astro/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import '../../utils/color_resource.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text_form_field.dart';
import '../feedback_screen/feedback_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // For form handling
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  String? _gender = 'Male';

  // Boolean to toggle views
  bool _showPersonalDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        backgroundColor: ColorResources.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(),
            SizedBox(height: 30),
            // Profile Card Section
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorResources.primaryColor.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '+91 9988774411.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _showPersonalDetails = true;
                                });
                              },
                              child: Text('Personal Details',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _showPersonalDetails = false;
                                });
                              },
                              child: Text('Settings',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: MediaQuery.of(context).size.width * 0.35,
                    right: MediaQuery.of(context).size.width * 0.35,
                    child: ClipOval(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/Planet.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Show content based on the boolean value
            _showPersonalDetails
                ? _buildPersonalDetailsForm()
                : _buildSettingsSection(),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(text: "Logout", onPressed: (){},backgroundColor: ColorResources.primaryColor,),
            )
          ],
        ),
      ),
    );
  }

  // Build Personal Details Form
  Widget _buildPersonalDetailsForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                labelText: 'Name',
                controller: _nameController,
                keyboardType: TextInputType.name,
                validator: (value) =>
                value!.isEmpty ? 'Name is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Phone Number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                value!.isEmpty ? 'Phone number is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                value!.isEmpty ? 'Email is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Date of Birth',
                controller: _dobController,
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                value!.isEmpty ? 'Date of Birth is required' : null,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Location',
                controller: _locationController,
                keyboardType: TextInputType.text,
                validator: (value) =>
                value!.isEmpty ? 'Location is required' : null,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                labelText: 'Zip Code',
                controller: _zipcodeController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Zip code is required' : null,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(text: "Submit", onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    // Save and submit form data
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Details submitted!')));
                  }
                },backgroundColor: ColorResources.primaryColor,),
              )

            ],
          ),
        ),
      ),
    );
  }

  // Build Settings Section
  Widget _buildSettingsSection() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('FAQ'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // Navigate to FAQ page
          },
        ),
        Divider(
          color: Colors.grey.shade200,
        ),

        ListTile(

          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Feedback'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen(),));
          },
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
        ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Terms & Conditions'),
          onTap: () {
            // Navigate to Terms & Conditions page
          },
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
        ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Privacy'),
          onTap: () {
            // Navigate to Privacy page
          },
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
        ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('About Us'),
          onTap: () {
            // Navigate to About Us page
          },
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
        ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          title: Text('Contact Us'),
          onTap: () {
            // Navigate to Contact Us page
          },
        ),
        Divider(
          color: Colors.grey.shade200,
        ),
      ],
    );
  }
}



