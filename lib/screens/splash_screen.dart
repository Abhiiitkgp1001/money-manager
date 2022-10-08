import 'package:flutter/material.dart';
import 'package:smscheck/SizeConfig.dart';
import 'package:smscheck/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                SizeConfig.safeBlockVertical * 12,
                SizeConfig.safeBlockHorizontal * 6,
                SizeConfig.safeBlockVertical * 3),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                        width: SizeConfig.safeBlockHorizontal * 60,
                        child: Image.asset(
                          "images/logo.png",
                        )),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Fin",
                                style: TextStyle(fontSize: 80),
                              ),
                              Text(
                                "X",
                                style: TextStyle(
                                    fontSize: 80, color: Color(0xff55A2F0)),
                              ),
                            ],
                          ),
                          Text(
                            "NeoBank for Students",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => LoginScreen()));
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Get Started",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
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
