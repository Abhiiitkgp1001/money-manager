import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:smscheck/SizeConfig.dart';
import 'package:smscheck/components/custom_textfield.dart';
import 'package:smscheck/screens/account_created.dart';
import 'package:smscheck/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AskEmailScreen extends StatefulWidget {
  const AskEmailScreen({Key? key}) : super(key: key);

  @override
  State<AskEmailScreen> createState() => _AskEmailScreenState();
}

class _AskEmailScreenState extends State<AskEmailScreen> {
  String email = "";
  bool error = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.white,
          //     Colors.white,
          //     Colors.white,
          //     Colors.blue,
          //   ],
          // )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.safeBlockHorizontal * 6,
                SizeConfig.safeBlockVertical * 6,
                SizeConfig.safeBlockHorizontal * 6,
                SizeConfig.safeBlockVertical * 3),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          width: SizeConfig.safeBlockHorizontal * 16,
                          child: Image.asset(
                            "images/logo.png",
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "FinX",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _keyboardVisible
                            ? Container()
                            : SizedBox(
                                height: SizeConfig.safeBlockVertical * 10,
                              ),
                        CustomTextField(
                            title: "Email",
                            onChanged: (item) {
                              setState(() {
                                email = item;
                              });
                            }),
                        if (error)
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: const Text(
                              "  Please enter a valid email",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                          setState(() {
                            error = false;
                          });
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => AccountCreatedScreen()));
                        } else
                          setState(() {
                            error = true;
                          });
                      },
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.safeBlockVertical * 2),
                                  decoration: BoxDecoration(
                                      color: Color(0xff7165E3),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )))
                        ],
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
