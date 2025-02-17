import 'package:new_astro/utils/color_resource.dart';
import 'package:flutter/material.dart';
import '../../utils/common/common_container.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';
import '../dashboard/dashboard_screen.dart';
import '../home/home_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: Stack(
        children: [
          // Background Image
          Positioned(
            top: 100,
            child: Image.asset(
              'assets/images/login.png',
              fit: BoxFit.fill, // Cover the full screen
            ),
          ),

          // Top White Bar

          // OTP Verification Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),

                  // Subheading
                  Text(
                    'A 4-digit code has been sent to your number',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(height: 10),

                  // Time
                  Center(
                    child: Text(
                      '0:58',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),

                  // OTP Fields
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 50,
                            child: TextField(
                              controller: otpControllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                counterText: "", // Hide character counter
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 3) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      print('Verify Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                    },
                    child: const Text(
                      'Verify OTP',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Login or Sign Up Divider
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "If you din't receive a code! Resend",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Continue with Email Button
                  OutlinedButton.icon(
                    onPressed: () {
                      print('Continue with Email Pressed');
                    },
                    icon: Icon(Icons.mobile_screen_share, color: Colors.white),
                    label: Text(
                      'Change Mobile Number',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      minimumSize: Size(double.infinity, 48),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 100),
//           // Top image container
//           Container(
//             width: double.infinity,
//             height: MediaQuery
//                 .of(context)
//                 .size
//                 .height * 0.40,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/login.png'),
//                 // Replace with your image asset path
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(height: 20),  // Added space between image and container
//
//           // Bottom container with rounded corners
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             decoration: const BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Heading and subheading
//                 CustomText(
//                   text: 'OTP Verification',
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: ColorResources.buttonTextColor,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//                 CustomText(
//                   text: 'An 4 digit code has been sent to your number',
//                   fontSize: 13,
//                   fontWeight: FontWeight.normal,
//                   color: ColorResources.buttonTextColor,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//                 // 4-digit OTP text field (added)
//                 CustomTextFormField(
//                   controller: otpController,
//                   hintText: 'Enter 4-digit code',
//                   hintStyle: const TextStyle(fontSize: 13),
//                   obscureText: false,
//                   keyboardType: TextInputType.number,
//                   maxLength: 4,  // Restrict to 4 digits
//                   border: InputBorder.none,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'OTP is required';
//                     }
//                     if (value.length != 4) {
//                       return 'OTP must be 4 digits';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 SizedBox(height: 20),  // Added space after OTP input field
//
//                 // Divider with "Login" text
//                 Row(
//                   children: const [
//                     Expanded(child: Divider()),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: CustomText(
//                         text: 'Log in or Sign up',
//                         fontSize: 13,
//                         fontWeight: FontWeight.bold,
//                         color: ColorResources.buttonTextColor,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Expanded(child: Divider()),
//                   ],
//                 ),
//
//
//                 SizedBox(height: 10),
//                 // Send OTP button
//                 CustomButton(
//                   height: 42,
//                   text: 'Verify',
//                   textStyle: const TextStyle(
//                       fontSize: 13, fontWeight: FontWeight.bold),
//                   backgroundColor: ColorResources.accentColor,
//                   textColor: ColorResources.textPrimaryColor,
//                   onPressed: () {
//                     print('Submit Button Pressed');
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
//
//                   },
//                 ),
//
//                 // Divider with text
//                 Row(
//                   children: const [
//                     Expanded(child: Divider()),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                         'OR',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: ColorResources.buttonTextColor,
//                         ),
//                       ),
//                     ),
//                     Expanded(child: Divider()),
//                   ],
//                 ),
//
//                 // Text button with icon
//                 CustomButton(
//                   height: 42,
//                   text: 'Continue with Email id',
//                   icon: Icons.email,
//                   textStyle: const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.bold,
//                       color: ColorResources.buttonTextColor),
//                   backgroundColor: Colors.transparent,
//                   textColor: ColorResources.buttonTextColor,
//                   borderColor: ColorResources.buttonTextColor,
//                   onPressed: () {
//                     print('Submit Button Pressed');
//                   },
//                 ),
//
//                 // Simple text widget
//                 Center(
//                   child: CustomText(
//                     text: 'By signing up, you agree to our Terms of Use and Privacy Policy',
//                     fontSize: 10,
//                     color: ColorResources.buttonTextColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//}
