import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/pages/history_share_transaction/transaction_model.dart';

class ShareTransactionCell extends StatelessWidget {

  final TransactionModel trans;

  final Color? bgColor;
  const ShareTransactionCell(
      this.trans, {
        Key? key,
        //this.onPressed,
        this.bgColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularStyle = TextStyle(
        fontFamily: 'iCielHelveticaNowText',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF333333));
    final regularGreenStyle = TextStyle(
        fontFamily: 'iCielHelveticaNowText',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF00B14F));
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      decoration:
          BoxDecoration(color: Color(0xFFF5F6FA), borderRadius: BOR_RAD8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    trans.nameCompany,
                    style: regularStyle,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    trans.numbers,
                    style: regularStyle,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    trans.price,
                    style: regularGreenStyle,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    trans.status,
                    style: regularGreenStyle,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
