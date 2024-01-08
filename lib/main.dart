import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/features/auth/views/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, centerTitle: true),
       scaffoldBackgroundColor: scaffoldBGColor,
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: greyColor,
          type: BottomNavigationBarType.fixed,
          backgroundColor: bottomNavigationBGColor,
        ),
      ),
      home: const SignIn(),
    );
  }
}

