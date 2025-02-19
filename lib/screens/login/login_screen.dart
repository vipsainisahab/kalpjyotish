import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_astro/utils/theme_color.dart';
import '../auth/otp_screen.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.textWhiteColor,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 150,
                height: 154,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/login_top.png'))),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Illustration Image
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/login_vector.png',
                  height: 300,
                ),
              ),
              SizedBox(height: Get.size.height * .17),
              // Login Form
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFE63946), // Red background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi Welcome!',
                      style: TextStyle(
                        color: ThemeColor.textWhiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Submit your Mobile number',
                      style: TextStyle(color: ThemeColor.textWhite70Color),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ThemeColor.textWhite70Color,
                            thickness: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Log in or Sign up',
                            style:
                                TextStyle(color: ThemeColor.textWhite70Color, fontSize: 14),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: ThemeColor.textWhite70Color,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Phone Number Field
                    costumTextfiled(),
                    const SizedBox(height: 10),
                    // Send OTP Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor.amberColor,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // controller.login();
                          Get.to(() => OtpScreen());
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.blackColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'By signing up, you agree to our Terms of Use and Privacy Policy',
                        style: TextStyle(color: ThemeColor.textWhite70Color, fontSize: 10.6),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget costumTextfiled() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeColor.textWhiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: 'Enter Mobile number',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('+91 |', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final List<Map<String, String>> countries = [
    {'flag': '🇺🇸', 'code': '+1', 'name': 'United States'},
    {'flag': '🇮🇳', 'code': '+91', 'name': 'India'},
    {'flag': '🇬🇧', 'code': '+44', 'name': 'United Kingdom'},
    {'flag': '🇨🇦', 'code': '+1', 'name': 'Canada'},
    {'flag': '🇦🇺', 'code': '+61', 'name': 'Australia'},
  ];

  String selectedCountryCode = '+1'; // Default country code

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeColor.textWhiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: 'Enter Mobile number',
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCountryCode,
              icon: const Icon(Icons.keyboard_arrow_down, color: ThemeColor.blackColor),
              items: countries.map((country) {
                return DropdownMenuItem(
                  value: country['code'], // Use the country code as the value
                  child: Row(
                    children: [
                      Text(country['flag']!),
                      const SizedBox(width: 8),
                      Text(country['code']!),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountryCode = value!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
