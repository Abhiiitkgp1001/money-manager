import 'package:flutter/material.dart';
import 'package:smscheck/SizeConfig.dart';
import 'package:smscheck/components/custom_textfield.dart';
import 'package:smscheck/screens/home_screen.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      // backgroundColor: Gr,
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
                  Flexible(
                    child: Column(
                      children: [
                        Container(
                            width: SizeConfig.safeBlockHorizontal * 60,
                            child: Image.asset(
                              "images/created.png",
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Account Created",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            "Dear user your account has been created successfully. Continue to start using app",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.safeBlockVertical * 2),
                                      decoration: BoxDecoration(
                                          color: Color(0xff7165E3),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )))
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "By clicking, you agree to our ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "Privacy Policy\n",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff7165E3),
                                      ),
                                    ),
                                    TextSpan(text: "and "),
                                    TextSpan(
                                        text: "Terms and Conditions",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff7165E3),
                                        )),
                                  ]))
                        ],
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
