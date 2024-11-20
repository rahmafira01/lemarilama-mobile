import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:lemari_lama/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Lemari Lama',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF7F6269),
          primary: Color(0xFF7F6269),
          secondary: Color(0xFF7F6269),
        ),
        useMaterial3: true,
      ),
        home: const LoginPage()
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lemari Lama',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Color(0xFF7F6269),
//           primary: Color(0xFF7F6269),
//           secondary: Color(0xFF7F6269),
//         ),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
