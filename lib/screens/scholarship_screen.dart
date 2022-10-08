import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:smscheck/screens/scholarship_detail_screen.dart';

class ScholarShipScreen extends StatefulWidget {
  const ScholarShipScreen({Key? key}) : super(key: key);

  @override
  State<ScholarShipScreen> createState() => _ScholarShipScreenState();
}

class _ScholarShipScreenState extends State<ScholarShipScreen> {
  Map<int, List<String>> mp = {};
  Future<void> read() async {
    ByteData data = await rootBundle.load("images/scholarship.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    int j = 0;
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        // ignore: curly_braces_in_flow_control_structures
        List<String> rw = [];
        row.forEach((element) {
          String s = element?.value.toString() ?? "";
          rw.add(s);
        });
        mp[j++] = rw;
      }
    }
    mp.remove(0);
    print("print map");
    for (var k in mp.keys) {
      print("Key : $k, value : ${mp[k]}");
    }
    print("printing done");
  }

  @override
  void initState() {
    read();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: read(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Container(
                      child: Text(
                        "Something went wrong!!!",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff232f3e),
                    ),
                  );
                }

                return ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Scholarships",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    for (var k in mp.keys)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ScholarShipDetailScreen(
                                    details: mp[k] ?? [],
                                  )));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xff232f3e),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mp[k]?[0] ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              Text(
                                mp[k]?[0] ?? "",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white60),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "images/reward.png",
                                          height: 60,
                                        ),
                                        Text(
                                          "Reward",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      mp[k]?[2] ?? "",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
