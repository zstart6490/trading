import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trading_module/pages/contract/contract_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';

class ContractPage extends GetView<ContractController> {
  const ContractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<ContractController>(
      showBackBtn: true,
      backgroundColor: Colors.white,
      title: "Hợp đồng sử dụng",
      body: Column(
        children: <Widget>[
          Expanded(
            //flex: 12,
            child:
                // Obx( () =>
                SfPdfViewer.network(
              "http://104.199.179.48:8501/v1/user/contract",
              scrollDirection: PdfScrollDirection.vertical,
            ),
            //),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 21, right: 21, top: 37, bottom: 57),
            child: CustomButton.defaultStyle(
              title: "Xác nhận",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SizedBox(
                      height: 225,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 77,
                              height: 77,
                              child: Image(
                                image: AssetImage(
                                    "packages/trading_module/assets/images/png/success.png"),
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
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF00B14F))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  //),
                );
              },
            ),
          )
          // ),
        ],
      ),
    );
  }
}
