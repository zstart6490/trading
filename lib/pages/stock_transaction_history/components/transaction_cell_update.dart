import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_module/domain/entities/stock_transaction_model.dart';



import 'package:trading_module/pages/stock_transaction_history/components/transaction_subText_strategy.dart';

import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/theme/app_color.dart';
import 'package:trading_module/utils/enums.dart';

import '../../../utils/util.dart';

class TransactionCellUpdate extends StatelessWidget {
  final String? parentProductId;
  final Transaction trans;
  final VoidCallback? onPressed;
  final TransactionSubTextStrategy? subTextStrategy;
  final Color? bgColor;
  const TransactionCellUpdate(
    this.trans, {
    Key? key,
    this.onPressed,
    this.bgColor,
    this.parentProductId,
    this.subTextStrategy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boolStyle = context.textSize14.copyWith(fontWeight: FontWeight.w500);
    final timeStyle = context.textSize12.copyWith(color: COLOR_NEUTRAL_300);

    final DateTime createDate = trans.createDate ?? DateTime.now();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onPressed?.call(),
      child: Container(
        color: bgColor ?? context.backgroundColor,
        child: Padding(
          padding: PAD_SYM_H16_V08,
          child: Row(
            children: [
              CustomShadow(
                  shape: BoxShape.circle, elevation: 1, child: _getIcon(trans)),
              SIZED_BOX_W08,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _getTitle(),
                            style: boolStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SIZED_BOX_W04,
                        _AmountComponent(
                          tran: trans,
                          amount: 100000,//trans.displayAmount,
                          parentProductId: parentProductId,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "20/06/2022",//createDate.toTimeDateString(),
                            style: timeStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SIZED_BOX_W04,
                        //_getTextByState(context, trans.getState),
                        _getTextByState(context, TransactionState.success),
                      ],
                    ),
                  ],
                ),
              ),
              SIZED_BOX_W16,
              RIGHT_ARROW_ICON
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTextByState(BuildContext context, TransactionState state) {
    String text;
    Color color;
    switch (state) {
      case TransactionState.success:
        text = "Th??nh c??ng";
        color = context.primaryColor;
        break;
      case TransactionState.failed:
        text = "Th???t b???i";
        color = context.errorColor;
        break;
      case TransactionState.create:
      case TransactionState.progressing:
        text = "??ang x??? l??";
        color = context.secondaryHeaderColor;
        break;

      default:
        text = "Th???t b???i";
        color = context.errorColor;
    }
    return Text(
      text,
      style: context.textSize12.copyWith(color: color),
    );
  }

  Widget _getIcon(Transaction trans) {
    late String path;
    if (trans.getMethod == TransactionMethod.renew) {
      path = "assets/images/svg/transaction_history/renew_ic.svg";
    } else if (trans.getMethod == TransactionMethod.moveProduct ||
        trans.getMethod == TransactionMethod.transferSaving ||
        trans.getMethod == TransactionMethod.moveSavingFromRealEstate) {
      path = "assets/images/svg/transaction_history/convert_ic.svg";
    } else if (trans.getMethod == TransactionMethod.referral) {
      path = "assets/images/svg/transaction_history/referral_ic.svg";
    } else if (trans.getType == TransactionType.deposit) {
      path = "assets/images/svg/transaction_history/recharge_ic.svg";
    } else {
      path = "assets/images/svg/transaction_history/withdraw_ic.svg";
    }

    return SvgPicture.asset(path, width: 24, height: 24);
  }

  String _getTitle() {
    final String subText = subTextStrategy?.getText() ?? '';
    return _getText() + subText;
  }

  String _getText() {
    if (trans.getMethod == TransactionMethod.renew) {
      return "Gia h???n h???p ?????ng";
    } else if (trans.getMethod == TransactionMethod.moveProduct) {
      return "Chuy???n ?????i t??ch l??y";
    } else if (trans.getMethod == TransactionMethod.transferSaving) {
      return "Chuy???n ?????i t??ch l??y";
    } else if (trans.getMethod == TransactionMethod.moveSavingFromRealEstate) {
      return "Chuy???n ?????i b???t ?????ng s???n";
    } else if (trans.getMethod == TransactionMethod.referral) {
      return "T???ng th?????ng";
    } else if (trans.getType == TransactionType.deposit) {
      return "N???p ti???n";
    } else {
      return "R??t ti???n";
    }
  }
}

class _AmountComponent extends StatelessWidget {
  const _AmountComponent({
    Key? key,
    required this.tran,
    required this.amount,
    this.parentProductId,
  }) : super(key: key);

  final String? parentProductId;
  final Transaction tran;
  final num amount;

  @override
  Widget build(BuildContext context) {
    final method = tran.getMethod;
    final childMethod = tran.childTransaction?.getMethod;

    if (childMethod == TransactionMethod.transferSaving) {
      /// N???u l?? giao d???ch chuy???n ?????i m?? c?? g??i ngu???n th?? check hi???n th??? theo t???ng case ri??ng bi???t
      if (parentProductId == null) {
        /// Xem t??? l???ch s??? giao d???ch
        return Text(amount.toCurrency(),
            style: context.textSize14.copyWith(fontWeight: FontWeight.w500));
      }
      // else if (parentProductId == tran.product?.id) {
      //   /// Xem t??? l???ch s??? giao d???ch c???a h???p ?????ng ngu???n
      //   return Text("-${amount.toCurrency()}",
      //       style: context.textSize14.copyWith(fontWeight: FontWeight.w500));
      // }
      else {
        /// Xem t??? l???ch s??? giao d???ch c???a h???p ?????ng ????ch
        return Text("+${amount.toCurrency()}",
            style: context.textSize14.copyWith(fontWeight: FontWeight.w500));
      }
    } else if (method == TransactionMethod.moveProduct ||
        method == TransactionMethod.renew ||
        method == TransactionMethod.moveSavingFromRealEstate) {
      /// N???u l?? giao d???ch chuy???n ?????i ho???c t??i t???c th?? ko hi???n th??? +-
      return Text(amount.toCurrency(),
          style: context.textSize14.copyWith(fontWeight: FontWeight.w500));
    }

    /// N???u l?? giao d???ch r??t ti???n th?? th??m -
    /// C??c giao d???ch c??n l???i th?? th?? th??m +
    final bool isWithdraw = tran.getType == TransactionType.withdraw;
    return Text(
      isWithdraw ? "-${amount.toCurrency()}" : "+${amount.toCurrency()}",
      style: context.textSize14.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
