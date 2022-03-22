import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/reason.dart';
import 'package:trading_module/pages/withdraw/reason/withdraw_reason_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';
import 'package:trading_module/shared_widgets/CustomShadow.dart';
import 'package:trading_module/utils/extensions.dart';

class WithdrawReasonScene extends GetView<WithdrawReasonController> {
  const WithdrawReasonScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseScaffoldAppBar<WithdrawReasonController>(
      title: "Rút tiền",
      body: SingleChildScrollView(
          child: Padding(
        padding: PAD_SYM_H16,
        child: controller.obx(
          (state) => Column(
            children: bindData(context, state!, controller),
          ),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Column(
            children: bindData(context,[], controller),
          ),
          onEmpty: Column(
            children: bindData(context,[], controller),
          ),
        ),
      )),
    );
  }
}

List<Widget> bindData(BuildContext context, List<Reason> state,
    WithdrawReasonController controller) {
  final childrens = [
    SIZED_BOX_H30,
    Image.asset("assets/images/png/withdraw_bg.png"),
    SIZED_BOX_H20,
    Text(
      "Lý do rút tiền của bạn là gì?",
      style: context.textSize16,
    ),
    Text(
      "Tikop sẽ giúp bạn đưa ra lựa chọn tối ưu",
      maxLines: 2,
      style: context.textSize14.copyWith(color: context.disabledColor),
      textAlign: TextAlign.center,
    ),
    SIZED_BOX_H16,
  ];
  final reasons = List<Widget>.generate(state.length, (index) {
    final reason = state[index];
    return _ReasonCell(
      index: index + 1,
      reason: reason.reason,
      onTapped: () => controller.selectedReason(reason),
    );
  });
  reasons.add(_ReasonCell(
    index: (state.length) + 1,
    reason: Reason.other().reason,
    onTapped: () => controller.selectedReason(Reason.other()),
  ));
  childrens.addAll(reasons);
  return childrens;
}

class _ReasonCell extends StatelessWidget {
  const _ReasonCell(
      {Key? key,
      required this.reason,
      required this.index,
      required this.onTapped})
      : super(key: key);
  final String reason;
  final int index;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: CustomShadow(
          child: Padding(
            padding: PAD_ALL16,
            child: Row(
              children: [
                Text(
                  "0$index.",
                  style: context.textSize14.copyWith(
                      color: context.primaryColor, fontWeight: FontWeight.bold),
                ),
                SIZED_BOX_W06,
                Expanded(
                    child: AutoSizeText(
                  reason,
                  maxLines: 2,
                  style:
                      context.textSize14.copyWith(fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
