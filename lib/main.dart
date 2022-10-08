import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smscheck/SizeConfig.dart';
import 'package:smscheck/provider.dart';
import 'package:smscheck/screens/account_created.dart';
import 'package:smscheck/screens/home_screen.dart';
import 'package:smscheck/screens/login_screen.dart';
import 'package:smscheck/screens/scholarship_screen.dart';
import 'package:smscheck/screens/splash_screen.dart';
import 'package:smscheck/screens/transction_detail_screen.dart';
import 'package:telephony/telephony.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Smsread(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        home: SplashScreen(),
      ),
    );
  }
}
