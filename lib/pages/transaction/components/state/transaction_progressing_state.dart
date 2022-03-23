import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/data/entities/StepData.dart';
import 'package:trading_module/domain/entities/transaction_detail.dart';
import 'package:trading_module/utils/enums.dart';
import 'package:trading_module/utils/extensions.dart';

class TransactionProgressingState extends StatelessWidget {
  final TransactionDetail transaction;

  const TransactionProgressingState({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StepData> steps = [];
    final desc = transaction.pendingStatus;

    steps = [
      StepData.step1(),
      StepData.step2(desc: desc),
    ];

    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15,top: 35),
      decoration: BoxDecoration(
          border: Border.all(color: context.disabledColor, width: 0.5),
          borderRadius: BOR_RAD8),
      child: Padding(
        padding: PAD_ALL16,
        child: Column(
            children: List.generate(
                steps.length,
                (index) => _Step(
                      step: steps[index],
                    ))),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({Key? key, required this.step}) : super(key: key);
  final StepData step;

  @override
  Widget build(BuildContext context) {
    Text state;
    Widget icon;
    switch (step.stepStatus) {
      case StepStatus.done:
        icon = Icon(
          Icons.check_circle,
          color: context.primaryColor,
          size: 24,
        );
        state = Text(
          "Thành công",
          style: context.textSize12.copyWith(
              fontWeight: FontWeight.w500, color: context.primaryColor),
        );
        break;
      case StepStatus.progressing:
        icon = SizedBox(
          width: 21,
          height: 21,
          child: CircularProgressIndicator(
              backgroundColor: context.disabledColor.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(context.primaryColor),
              strokeWidth: 3.0),
        );
        state = Text(
          "Đang xử lý",
          style: context.textSize12.copyWith(
              fontWeight: FontWeight.w500, color: context.secondaryHeaderColor),
        );
        break;
    }
    return Column(
      children: [
        Row(
          children: [
            icon,
            SIZED_BOX_W10,
            Expanded(
              child: Text(
                step.title,
                style: context.textSize14.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            state,
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11.0, top: 6, bottom: 6),
          child: Container(
            margin: const EdgeInsets.only(top: 2, bottom: 2),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: step.stepStatus == StepStatus.done
                            ? context.primaryColor
                            : Colors.transparent,
                        width: step.isLast ? 0 : 2))),
            child: Padding(
              padding: const EdgeInsets.only(left: 23, right: 8),
              child: Column(
                children: [
                  if (step.desc != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AutoSizeText(
                        step.desc!,
                        style: context.textSize12
                            .copyWith(color: context.disabledColor),
                      ),
                    ),
                  if (step.descLv2 != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AutoSizeText(
                        step.descLv2!,
                        style: context.textSize12
                            .copyWith(color: context.secondaryHeaderColor),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
