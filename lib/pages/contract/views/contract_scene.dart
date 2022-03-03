import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/contract/controllers/contract_controller.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/png/bt_back.png"),
        title: Text(
          "Hợp đồng sử dụng",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'iCielHelveticaNowText',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: SfPdfViewer.network(
              'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
              scrollDirection: PdfScrollDirection.vertical,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // padding:
              // new EdgeInsets.only(top: 17,bottom: 57,left: 21, right: 21),
              height: 52,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  child:Container(
                    padding: new EdgeInsets.fromLTRB(80, 5, 80, 5),
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'iCielHelveticaNowText',
                        color: Colors.white,
                      ),
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: SizedBox(
                            height: 220,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 77,
                                    height: 77,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/png/success.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "Đăng ký chứng khoán thành công",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'iCielHelveticaNowText',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Đăng ký chứng khoán thành công bạn có thể bắt đầu đầu tư ngay bây giờ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'iCielHelveticaNowText',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16),
                                
                                TextButton(
                                  child: Container(
                                    padding: new EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Text(
                                      "Tôi đã hiểu",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'iCielHelveticaNowText',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
