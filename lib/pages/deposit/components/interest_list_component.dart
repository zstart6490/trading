import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tikop/modules/deposit/interest_tool/base_interest_controller.dart';
import 'package:tikop/utils/util.dart';

class InterestListComponent<T extends BaseInterstController>
    extends StatelessWidget {
  const InterestListComponent({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(builder: (controller) {
      List<Widget> children = [];
      children = List.generate(
          controller.interestDataList.length,
          (index) => Padding(
                padding: PAD_SYM_V05,
                child: _InterestCell(
                  key: UniqueKey(),
                  data: controller.interestDataList[index],
                ),
              ))
        ..insert(
          0,
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
            child: Text(
              "Dự tính lãi",
              style: context.textSize14.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        );
      return Container(
          color: context.backgroundColor,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: children));
    });
  }
}

class _InterestCell extends StatelessWidget {
  const _InterestCell({Key? key, required this.data}) : super(key: key);
  final InterestData data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListTile(
        leading: SvgPicture.asset("assets/images/svg/ic_interest_cell.svg"),
        title: Text(data.monthDisplay,
            style: context.textSize14.copyWith(fontWeight: FontWeight.w500)),
        subtitle: Text(data.endTime,
            style: context.textSize12.copyWith(color: context.disabledColor)),
        trailing: Text(data.money,
            style: context.textSize14.copyWith(
                color: context.primaryColor, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
