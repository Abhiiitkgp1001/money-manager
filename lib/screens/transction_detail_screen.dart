import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:provider/provider.dart';
import 'package:smscheck/class/sms_class.dart';
import 'package:smscheck/const.dart';
import 'package:smscheck/provider.dart';

class TransactionalDetailScreen extends StatefulWidget {
  const TransactionalDetailScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<TransactionalDetailScreen> createState() =>
      _TransactionalDetailScreenState();
}

class _TransactionalDetailScreenState extends State<TransactionalDetailScreen> {
  List<sms> list = [
    sms(account: "2014xxxx2085", amt: "1423", msg: ""),
    sms(account: "2014xxxx2014", amt: "1425", msg: ""),
    sms(account: "2014xxxx1452", amt: "1052", msg: ""),
    sms(account: "2014xxxx0145", amt: "1078", msg: ""),
    sms(account: "2014xxxx1247", amt: "2562", msg: ""),
    sms(account: "2014xxxx1487", amt: "14855", msg: ""),
    sms(account: "2014xxxx4587", amt: "12540", msg: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Transaction Details",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              for (int i = 0;
                  i < Provider.of<Smsread>(context, listen: false).list.length;
                  i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xff232f3e),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<Smsread>(context, listen: false)
                                  .list[i]
                                  .msg,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "A/c - ${Provider.of<Smsread>(context, listen: false).list[i].account}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white38),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${Provider.of<Smsread>(context, listen: false).list[i].amt}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
