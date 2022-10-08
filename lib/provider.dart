import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:smscheck/class/sms_class.dart';
import 'package:telephony/telephony.dart';

class Smsread with ChangeNotifier {
  List<sms> list = [];
  final Telephony telephony = Telephony.instance;
  Future<void> read_sms() async {
    List<SmsMessage> messages = await telephony.getInboxSms(
      columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
    );
    List<String> msg = [];
    for (int i = 0; i < 50; i++) {
      msg.add(messages[i].body ?? "");
    }
    // print(msg);
    try {
      final response = await http.post(
          Uri.parse(
              "https://9mmkahiz96.execute-api.ap-south-1.amazonaws.com/dev/datasaver"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({"data": msg}));
      print("Response code: ${response.statusCode}");
      if (response.statusCode == 200) {
        print("response");
        print(response.body);
        var obj = jsonDecode(response.body);

        Timer.periodic(Duration(seconds: 5), (timer) async {
          final response2 = await http.post(
              Uri.parse(
                  "https://9mmkahiz96.execute-api.ap-south-1.amazonaws.com/dev/extracted_data"),
              headers: {
                'Content-Type': 'application/json',
              },
              body: json.encode({
                "userhash": obj["userhash"],
              }));
          print("Response code2: ${response2.statusCode}");

          if (response2.statusCode == 200) {
            print("response_code2 ${response2.body}");
            final data1 = jsonDecode(response2.body) as List;
            final data2 = data1[0]["data"] as List;
            for (int i = 0; i < data2.length; i++) {
              list.add(sms(
                  account: data2[i]["account_no"] ?? "",
                  amt: data2[i]["amount"] ?? "",
                  msg: data2[i]["message"] ?? ""));
            }
            timer.cancel();
          }
        });

        notifyListeners();
      }
    } catch (error) {
      print("error occured");
      print(error);
    }
  }
}
