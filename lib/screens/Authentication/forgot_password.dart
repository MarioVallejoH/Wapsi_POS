// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:nb_utils/nb_utils.dart';
// import 'package:pos_wappsi/components/button_global.dart';
// import 'package:pos_wappsi/screens/Authentication/check_email.dart';

// import '../../constant.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({Key? key}) : super(key: key);

//   @override
//   _ForgotPasswordState createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text(
//                   'Forgot password',
//                   style: GoogleFonts.poppins(
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     "Please enter your email address below to recive your OTP number.",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       color: kGreyTextColor,
//                       fontSize: 20.0,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: AppTextField(
//                     controller: TextEditingController(), // Optional
//                     textFieldType: TextFieldType.EMAIL,
//                     decoration: InputDecoration(
//                         labelText: 'Email Address',
//                         border: OutlineInputBorder(),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         hintText: 'example@example.com'),
//                   ),
//                 ),
//                 ButtonGlobalWithoutIcon(
//                     buttontext: 'Send OTP',
//                     buttonDecoration:
//                         kButtonDecoration.copyWith(color: Theme.of(context).primaryColor),
//                     onPressed: () {
//                       CheckEMail().launch(context);
//                     },
//                     buttonTextColor: Colors.white),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
