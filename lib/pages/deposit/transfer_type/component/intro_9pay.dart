import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tikop/utils/util.dart';

class Intro9PayComponent extends StatefulWidget {
  const Intro9PayComponent({Key? key}) : super(key: key);

  @override
  _Intro9PayComponentState createState() => _Intro9PayComponentState();
}

class _Intro9PayComponentState extends State<Intro9PayComponent> {
  late bool isShowInfo;

  @override
  void initState() {
    super.initState();
    isShowInfo = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Giới thiệu về 9Pay",
              style: context.textSize12
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  isShowInfo = !isShowInfo;
                });
              },
              child: Icon(
                isShowInfo
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.blue,
                size: 32,
              ),
            ),
          ],
        ),
        if (isShowInfo)
          Container(
            decoration: const BoxDecoration(
                borderRadius: BOR_RAD8, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: const [
                  _Cell(
                    desc:
                        "Là đơn vị cung cấp dịch vụ Cổng thanh toán điện tử, có giấy phép hoạt động số 60/GP-NHNN do Ngân hàng nhà nước Việt Nam cung cấp",
                  ),
                  SIZED_BOX_H12,
                  _Cell(
                    desc:
                        "Thông qua Cổng thanh toán 9Pay, tiền nạp của khách hàng sẽ được tự động chuyển vào tài khoản Tikop.",
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({Key? key, required this.desc}) : super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 6.0, 6.0, 0.0),
          child: SvgPicture.asset("assets/images/svg/ic_blue_dot.svg"),
        ),
        Expanded(
          child: Text(
            desc,
            maxLines: 10,
            style: context.textSize12,
          ),
        ),
      ],
    );
  }
}
