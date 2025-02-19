// import 'package:new_astro/utils/theme_color.dart';
// import 'package:flutter/material.dart';
//
// import '../../utils/common/common_container.dart';
// import '../../widgets/custom_btn.dart';
// import '../../widgets/custom_text.dart';
// import '../../widgets/custom_text_form_field.dart';
//
// import 'package:flutter/material.dart';
//
// import 'otp_screen.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//
//   final TextEditingController phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundScreen(
//       child:  Stack(
//         alignment: Alignment.center,
//         children: [
//
//           // Background Image
//           Positioned(
//             top: 100,
//             child: Image.asset(
//               'assets/images/login.png',
//               fit: BoxFit.fill, // Cover the full screen
//             ),
//           ),
//           // Foreground Content
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.50,
//               padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
//               decoration: const BoxDecoration(
//                 color: ThemeColor.redColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   // **Heading**
//                   Text(
//                     'Hi, Welcome!',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: ThemeColor.textWhiteColor,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     'Submit your Mobile number',
//                     style: TextStyle(fontSize: 13, color: ThemeColor.textWhiteColor),
//                   ),
//                   const SizedBox(height: 10),
//
//                   // **Divider with "Login" Text**
//                   Row(
//                     children: const [
//                       Expanded(child: Divider(color: ThemeColor.textWhiteColor)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           'Log in or Sign up',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             color: ThemeColor.textWhiteColor,
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Divider(color: ThemeColor.textWhiteColor)),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//
//                   // **Mobile Number Input**
//                   Container(
//                     height: 48,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: ThemeColor.textWhiteColor,
//                     ),
//                     child: Row(
//                       children: [
//                          Expanded(
//                           flex: 1,
//                           child: TextField(
//                             enabled: false,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: '+91',
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 3,
//
//                           child: TextFormField(
//                             keyboardType: TextInputType.phone,
//                             decoration:  InputDecoration(
//                               hintText: ' Enter your mobile',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   // **Send OTP Button**
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: ThemeColor.amberColor,
//                       shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
//
//                       minimumSize: const Size(double.infinity, 48),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(),));
//                     },
//                     child: const Text(
//                       'SEND OTP',
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   // **Divider with OR**
//                   Row(
//                     children: const [
//                       Expanded(child: Divider(color: ThemeColor.textWhiteColor)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           'OR',
//                           style: TextStyle(fontSize: 13, color: ThemeColor.textWhiteColor),
//                         ),
//                       ),
//                       Expanded(child: Divider(color: ThemeColor.textWhiteColor)),
//                     ],
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   // **Continue with Email Button**
//                   OutlinedButton.icon(
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: ThemeColor.textWhiteColor,
//                       shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       side: const BorderSide(color: ThemeColor.textWhiteColor),
//                       minimumSize: const Size(double.infinity, 48),
//                     ),
//                     onPressed: () {
//                       print('Continue with Email');
//                     },
//                     icon: const Icon(Icons.email, color: ThemeColor.textWhiteColor),
//                     label: const Text(
//                       'Continue with Email ID',
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   // **Terms & Privacy**
//                   const Center(
//                     child: Text(
//                       'By signing up, you agree to our Terms of Use and Privacy Policy',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 10, color: ThemeColor.textWhiteColor),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
