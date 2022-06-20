import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:trading_module/domain/entities/stock_transaction_model.dart';
import 'package:trading_module/pages/stock_transaction_history/components/transaction_cell_update.dart';
import 'package:trading_module/utils/util.dart';

class TransactionSection extends StatelessWidget {
  final String? parentProductId;
  final List<Transaction> sectionData;
  final Function(Transaction) onPressed;
  final DateTime headerTime;

  const TransactionSection({
    Key? key,
    required this.sectionData,
    required this.onPressed,
    required this.headerTime,
    this.parentProductId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: TransactionHeader(
        date: headerTime,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => TransactionCellUpdate(
            sectionData[index],
            onPressed: () => onPressed(sectionData[index]),
            parentProductId: parentProductId,
          ),
          childCount: sectionData.length,
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
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 42,
        color: const Color(0xFFEBFAF2),
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
