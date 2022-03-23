import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/cash_in_confirm_model.dart';
import 'package:trading_module/shared_widgets/BankIcon.dart';



class BankListComponent extends StatelessWidget {
  final List<BankCashInModel> banks;
  final BankCashInModel? selectedBank;
  final Function(int) onSelectedIndex;
  final Key? bankKey;
  final ScrollController? scrollController;
  const BankListComponent({
    Key? key,
    required this.banks,
    required this.onSelectedIndex,
    this.scrollController,
    this.selectedBank,
    this.bankKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: ListView.builder(
        controller: scrollController,
        padding: PAD_ALL16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => BankIcon(
          bankIcon: banks[index].imageUrl,
          bankName: banks[index].code,
          onTapped: () => onSelectedIndex(index),
          isSelected: selectedBank?.id == banks[index].id,
          key: selectedBank?.id == banks[index].id ? bankKey : null,
        ),
        itemCount: banks.length,
      ),
    );
  }
}
