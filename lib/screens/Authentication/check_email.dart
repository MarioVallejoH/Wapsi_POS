// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pos_wappsi/components/button_global.dart';

// import '../../constant.dart';


// class CheckEMail extends StatefulWidget {
//   const CheckEMail({Key? key}) : super(key: key);

//   @override
//   _CheckEMailState createState() => _CheckEMailState();
// }

// class _CheckEMailState extends State<CheckEMail> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Expanded(
//                 // flex: 5,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 100.0,
//                     width: 100.0,
//                     child: Image(
//                       image: AssetImage('assets/images/mailbox.png'),
//                     ),
//                   ),
//                   Text(
//                     'You Have Got An Email',
//                     style: GoogleFonts.poppins(
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(20.0),
//                     width: MediaQuery.of(context).size.width,
//                     child: Text(
//                       'We Have Send An Email with instructions on how to reset password to:',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                         fontSize: 20.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'example@johndoe.com',
//                     style: GoogleFonts.poppins(
//                       fontSize: 20.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),),
//               Expanded(
//                 flex: 1,
//                   child: Column(
//                 children: [
//                   ButtonGlobalWithoutIcon(
//                     buttontext: 'Check Email',
//                     buttonDecoration: kButtonDecoration.copyWith(color: Theme.of(context).primaryColor),
//                     onPressed: null,
//                     buttonTextColor: Colors.white,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/otp');
//                     },
//                     child: Text(
//                       'Close',
//                       style: GoogleFonts.poppins(
//                         color: Theme.of(context).primaryColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ))

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
