import 'package:flutter/material.dart';
import 'package:tikop/models/VirtualAccount.dart';
import 'package:tikop/utils/util.dart';

class RecurringTransferComponent extends StatelessWidget {
  const RecurringTransferComponent({
    Key? key,
    required this.mListVA,
    this.showDesc1 = true,
  }) : super(key: key);
  final bool showDesc1;
  final List<VirtualAccount> mListVA;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "*",
                  style: context.textSize12.copyWith(color: context.errorColor),
                ),
                TextSpan(text: "Lưu ý:", style: context.textSize12),
              ],
            ),
          ),
          SIZED_BOX_H04,
          _BankReceiveMoneyCell(
            listVA: mListVA,
          ),
          SIZED_BOX_H04,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4.0,
                height: 4.0,
                margin: const EdgeInsets.fromLTRB(2.0, 6.0, 4.0, 0.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFBE40)),
              ),
              Expanded(
                  child: Text(
                "Không cần điền mã nội dung",
                style:
                    context.textSize12.copyWith(color: context.disabledColor),
              )),
            ],
          ),
          SIZED_BOX_H04,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4.0,
                height: 4.0,
                margin: const EdgeInsets.fromLTRB(2.0, 6.0, 4.0, 0.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFFFBE40)),
              ),
              Expanded(
                child: Text(
                  "Cần đặt lịch chuyển tiền trên app ngân hàng của bạn",
                  style:
                      context.textSize12.copyWith(color: context.disabledColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BankReceiveMoneyCell extends StatelessWidget {
  const _BankReceiveMoneyCell({Key? key, required this.listVA})
      : super(key: key);
  final List<VirtualAccount> listVA;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4.0,
          height: 4.0,
          margin: const EdgeInsets.fromLTRB(2.0, 6.0, 4.0, 0.0),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFFFFBE40)),
        ),
        if (listVA.length == 1)
          Text(
            "Ngân hàng nhận tiền là ${listVA.first.bank.code}",
            style: context.textSize12.copyWith(color: context.disabledColor),
          )
        else
          Text(
            "Ngân hàng nhận tiền:",
            style: context.textSize12.copyWith(color: context.disabledColor),
          ),
        SIZED_BOX_W08,
        if (listVA.length > 1)
          Expanded(
              child: _ListBankRecurring(
            listVA: listVA,
          ))
      ],
    );
  }
}

class _ListBankRecurring extends StatelessWidget {
  final List<VirtualAccount> listVA;
  const _ListBankRecurring({Key? key, required this.listVA}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            listVA.length <= 3 ? listVA.length : 4,
            (index) => (index != 3)
                ? Row(
                    children: [
                      Image.network(
                        listVA[index].bank.imageUrl,
                        width: 24,
                        height: 24,
                      ),
                      SIZED_BOX_W08
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                            borderRadius: BOR_RAD12, color: Color(0xffF5F6FA)),
                        child: Center(
                          child: Text(
                            "+ ${listVA.length - 3}",
                            style: context.textSize12
                                .copyWith(color: context.primaryColor),
                          ),
                        ),
                      ),
                      SIZED_BOX_W08
                    ],
                  )));
  }
}
