// import 'package:flower_bouquet_20_10/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Chúc mừng ngày phụ nữ Việt Nam 20-10',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.pink[700],
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               width: 200,
//               height: 250,
//               child: Lottie.asset('./assets/flower1.json'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
