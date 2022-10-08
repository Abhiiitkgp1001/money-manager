import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:smscheck/SizeConfig.dart';
import 'package:excel/excel.dart';

import 'package:smscheck/components/custom_textfield.dart';
import 'package:smscheck/const.dart';
import 'package:smscheck/screens/scholarship_screen.dart';
import 'package:smscheck/screens/transction_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff55A2F0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 8),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${inr_symbol}7,425",
                                  style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 48,
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff7165E3)),
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                        height: 1.28,
                                        fontSize: 36,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Available balance",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.88),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 4,
                            right: SizeConfig.safeBlockHorizontal * 4,
                            top: SizeConfig.safeBlockVertical * 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 24, left: 24, right: 24, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // ignore: prefer_const_constructors
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.safeBlockVertical *
                                                3),
                                        child: CircleAvatar(
                                          radius: 6,
                                          backgroundColor: Color(0xffFF5141),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Spent"),
                                          Text(
                                            "${inr_symbol}1,425",
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.safeBlockVertical *
                                                3),
                                        child: CircleAvatar(
                                          radius: 6,
                                          backgroundColor: Color(0xff967AF3),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Earned"),
                                          Text(
                                            "${inr_symbol}2,730",
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                              padding: EdgeInsets.only(top: 12, left: 16),
                              child: Text(
                                "You spent ${inr_symbol}2,732 on dining out this month.",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 32),
                        child: Text(
                          "Let’s try to make it lower",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 12, left: 32),
                        child: Text(
                          "Tell me more",
                          style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: Color(0xff7165E3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 32, left: 32),
                  child: Text(
                    "Activity",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => TransactionalDetailScreen()));
                        },
                        child: Card(
                          shadowColor: Colors.black26,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            padding: EdgeInsets.all(14),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xff7165E3),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Image.asset(
                                    "images/expense.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    "Expense Tracker",
                                    style: TextStyle(
                                      fontSize: 10.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shadowColor: Colors.black26,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color(0xff7165E3),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset(
                                  "images/document.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(
                                  "Statement",
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ScholarShipScreen()));
                        },
                        child: Card(
                          shadowColor: Colors.black26,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(0xff7165E3),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Image.asset(
                                    "images/scholarship.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    "Scholarship",
                                    style: TextStyle(
                                      fontSize: 10.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Expanded(
                      child: Card(
                        shadowColor: Colors.black26,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Color(0xff7165E3),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset(
                                  "images/daily.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 16),
                                child: Text(
                                  "Budget Creater",
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
                // Container(
                //   color: Colors.white,
                //   padding: EdgeInsets.only(top: 32, left: 32),
                //   child: Text(
                //     "Complete Verification",
                //     style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.black,
                //         fontWeight: FontWeight.w600),
                //   ),
                // ),
                Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 48),
                    child: Image.asset(
                      "images/card.png",
                      width: SizeConfig.safeBlockHorizontal * 60,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    "This month spending",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    "${inr_symbol}1,785",
                    style: TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.center,
                  child: Text(
                    "Well done you have maintain your spending under control",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff1C1939).withOpacity(0.8),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.safeBlockVertical * 2),
                              decoration: BoxDecoration(
                                  color: Color(0xff7165E3),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Great",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )))
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 8, left: 32),
                  child: Text(
                    "Top Category",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        shadowColor: Colors.black12,
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 32),
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "images/lunch.png",
                                  width: SizeConfig.safeBlockHorizontal * 15,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Lunch & Dinner",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  "${inr_symbol}450",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Color(0xffF9F9FB),
                                    borderRadius: BorderRadius.circular(16)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                alignment: Alignment.center,
                                child: Text(
                                  "on track",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff7D8CBA),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shadowColor: Colors.black12,
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 32),
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "images/meds.png",
                                  width: SizeConfig.safeBlockHorizontal * 15,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Medcial Allowances",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${inr_symbol}330",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    color: Color(0xffF9F9FB),
                                    borderRadius: BorderRadius.circular(16)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                alignment: Alignment.center,
                                child: Text(
                                  "on track",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff7D8CBA),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
