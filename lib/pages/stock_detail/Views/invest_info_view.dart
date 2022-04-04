import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/pages/stock_detail/stock_detail_controller.dart';


import 'package:trading_module/utils/util.dart';

class InvestInfoView extends GetView<StockDetailController> {
  const InvestInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Column(children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Thông tin đầu tư",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'iCielHelveticaNowText',
              decoration: TextDecoration.none,
            ),
          ),
        ),
        SIZED_BOX_H16,
        Row(
          children: const [
            Expanded(
                child: InvestInfoItem(
                    title: "TB giá mua  (đ)",
                    desc: "17.500",
                    imgUrl: "assets/images/png/ic_avg_bought_price.png",
                    descColor: Color(0xFF333333))),
            SIZED_BOX_W45,
            Expanded(
                child: InvestInfoItem(
                    title: "Tiền vốn (đ)",
                    desc: "17.000.000",
                    imgUrl: "assets/images/png/ic_funds.png",
                    descColor: Color(0xFF333333))),
          ],
        ),
        SIZED_BOX_H16,
        Row(
          children: const [
            Expanded(
                child: InvestInfoItem(
                    title: "Giá hiện tại (đ)",
                    desc: "18.500",
                    imgUrl: "assets/images/png/ic_current_price.png",
                    descColor: Color(0xFF333333))),
            SIZED_BOX_W45,
            Expanded(
                child: InvestInfoItem(
                    title: "Lãi lỗ (đ)",
                    desc: "-1.000.000.000.000(-0,15%)",
                    imgUrl: "assets/images/png/ic_profit_loss.png",
                    descColor: Color(0xFFF46666))),
          ],
        ),
      ]),
    );
  }
}

class InvestInfoItem extends StatelessWidget {
  const InvestInfoItem({
    required this.title,
    required this.desc,
    required this.imgUrl,
    required this.descColor,
    Key? key,
  }) : super(key: key);
  final String title;
  final String desc;
  final String imgUrl;
  final Color descColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          width: 44,
          height: 44,
          image: AssetImage(imgUrl, package: "trading_module"),
        ),
        SIZED_BOX_W10,
        Expanded(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 12,
                    fontFamily: 'iCielHelveticaNowText',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SIZED_BOX_H02,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  desc,
                  style: TextStyle(
                    color: descColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'iCielHelveticaNowText',
                    decoration: TextDecoration.none,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
