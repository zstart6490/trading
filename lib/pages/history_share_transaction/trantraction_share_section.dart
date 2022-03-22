import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/history_share_transaction/share_transaction_cell.dart';
import 'package:trading_module/pages/history_share_transaction/transaction_model.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/extensions.dart';

class TransactionShareSection extends StatelessWidget {
  //final String? parentProductId;
  final List<TransactionModel> sectionData;

  //final Function(TransactionModel) onPressed;
  final DateTime headerTime;

  const TransactionShareSection({
    Key? key,
    required this.sectionData,
    //required this.onPressed,
    required this.headerTime,
    //this.parentProductId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularStyle = TextStyle(
        fontFamily: 'iCielHelveticaNowText',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF858585));

    return SliverStickyHeader(
      header: TransactionHeader(
        date: headerTime,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                height: 40,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Mã CP",
                        textAlign: TextAlign.center,
                        style: regularStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Khối lượng",
                        textAlign: TextAlign.center,
                        style: regularStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Giá khớp",
                        textAlign: TextAlign.center,
                        style: regularStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Trạng thái",
                        textAlign: TextAlign.center,
                        style: regularStyle,
                      ),
                    ),
                  ],
                ),
                color: Colors.white,
              );
            } else
              return SizedBox(
                height: 64,
                child: ShareTransactionCell(
                  sectionData[index - 1],
                  //onPressed: () => onPressed(),
                  //parentProductId: parentProductId,
                ),
              );
          },
          childCount: 6,
        ),
      ),
    );
  }
}

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0 , top : 16.0),
      child: Container(
        width: double.infinity,
        height: 44,
        color: const Color(0xFFF5F6FA),
        child: Row(
          children: [
            Padding(
              padding: PAD_SYM_H16,
              child: Text(
                "Tháng ${date.toStringFormat(DateFormater.MMYYYY)}",
                style: context.textSize14.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
