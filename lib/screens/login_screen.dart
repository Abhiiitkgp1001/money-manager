import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';
import 'package:smscheck/SizeConfig.dart';
import 'package:smscheck/components/custom_textfield.dart';
import 'package:smscheck/provider.dart';
import 'package:smscheck/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'ask_email.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String name = "", phnNo = "", OTP = "", verId = "";
  bool error = false;
  bool tapped = false;
  bool otpSend = false;
  bool verifyOtp = false;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      print(value.user);
      return value;
    });
  }

  Future<void> sentOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 $phnNo',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("verification Completed");
        await auth.signInWithCredential(credential).then((value) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => AskEmailScreen()));
        }).catchError((err) {
          Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print("verification Failed");
        Fluttertoast.showToast(
          msg: "Failed to send OTP",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        setState(() {
          tapped = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("code sent $verificationId");
        setState(() {
          otpSend = true;
          verId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> login(String verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: OTP);
    await auth.signInWithCredential(credential).then((value) {
      print(value.user);
      setState(() {
        verifyOtp = true;
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => AskEmailScreen()));
    }).catchError((err) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     elevation: 5,
      //     padding: EdgeInsets.only(top: 5),
      //     content: Text("Login Failed")));
      Fluttertoast.showToast(
        msg: "Login Failed",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      setState(() {
        verifyOtp = false;
      });
    });
  }

  bool _f = true;
  void didChangeDependencies() {
    if (_f) {
      Provider.of<Smsread>(context).read_sms();
    }
    _f = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: otpSend
            ? Container(
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
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Verify Account!",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Enter 6-digit Code code we have sent to your phone \n+91 $phnNo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Container(
                              width: 320,
                              child: PinInputTextFormField(
                                initialValue: "",
                                onChanged: (change) {
                                  setState(() {
                                    OTP = change;
                                  });
                                },
                                pinLength: 6,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: false, decimal: false),
                                decoration: UnderlineDecoration(
                                  gapSpace: 16,
                                  lineHeight: 1.14,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  colorBuilder: PinListenColorBuilder(
                                      Colors.black45, Colors.black54),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Didn't not received the code?",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 110,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xff7165E3)))),
                              child: Text(
                                "Resend Code",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff7165E3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: verifyOtp
                                ? null
                                : () async {
                                    setState(() {
                                      verifyOtp = true;
                                    });
                                    if (OTP.length == 6) {
                                      print(verId);
                                      await login(verId);
                                    }
                                  },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: SizeConfig
                                                        .safeBlockVertical *
                                                    2),
                                            decoration: BoxDecoration(
                                                color: verifyOtp
                                                    ? Color(0xff7165E3)
                                                        .withOpacity(0.75)
                                                    : Color(0xff7165E3),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: verifyOtp
                                                ? Center(
                                                    child: Container(
                                                      height: 24,
                                                      width: 24,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "Proceed",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
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
              )
            : Container(
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
                            children: [
                              _keyboardVisible
                                  ? Container()
                                  : SizedBox(
                                      height: SizeConfig.safeBlockVertical * 10,
                                    ),
                              CustomTextField(
                                  title: "Name",
                                  onChanged: (item) {
                                    setState(() {
                                      name = item;
                                    });
                                  }),
                              CustomTextField(
                                  prefix: true,
                                  title: "Mobile Number",
                                  inputType: TextInputType.number,
                                  onChanged: (item) {
                                    setState(() {
                                      phnNo = item;
                                    });
                                  }),
                              Row(children: [
                                Checkbox(
                                    value: check,
                                    fillColor: MaterialStateProperty.all(
                                        Color(0xff7165E3)),
                                    onChanged: (item) {
                                      setState(() {
                                        check = !check;
                                      });
                                    }),
                                Flexible(
                                  child: Text(
                                    "By creating your account you have to agree with our Teams and Conditions.",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ]),
                              if (error)
                                Container(
                                  margin: EdgeInsets.only(top: 48),
                                  child: const Text(
                                    "Please fill the correct details and check the box",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ),
                              SizedBox(
                                height: 16,
                              ),
                              FloatingActionButton(
                                  onPressed: () async {
                                    await signInWithGoogle();
                                  },
                                  splashColor: Colors.white,
                                  backgroundColor: Color(0xff7165E3),
                                  elevation: 0,
                                  child: Text(
                                    "G",
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: tapped
                                ? null
                                : () async {
                                    setState(() {
                                      tapped = true;
                                    });
                                    if (check &&
                                        name.length > 0 &&
                                        phnNo.length == 10) {
                                      setState(() {
                                        error = false;
                                      });
                                      await sentOTP();
                                      Timer(Duration(seconds: 5), () => {});
                                    } else {
                                      setState(() {
                                        error = true;
                                        tapped = false;
                                      });
                                    }
                                  },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                SizeConfig.safeBlockVertical *
                                                    2),
                                        decoration: BoxDecoration(
                                            color: tapped
                                                ? Color(0xff7165E3)
                                                    .withOpacity(0.75)
                                                : Color(0xff7165E3),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: tapped
                                            ? Center(
                                                child: Container(
                                                  height: 24,
                                                  width: 24,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                "Continue",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
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
