import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tikop/models/SavingProduct.dart';
import 'package:tikop/modules/deposit/interest_tool/interest_tool_local/interest_tool_controller.dart';
import 'package:tikop/shared_widgets/BaseShimmer.dart';
import 'package:tikop/utils/util.dart';

class InterestProductsComponent extends GetView<InterestToolController> {
  const InterestProductsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.backgroundColor,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                child: Text(
                  "Chọn gói Tikop",
                  style:
                      context.textSize14.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              GetBuilder<InterestToolController>(builder: (controller) {
                if (controller.listProducts.isEmpty) {
                  return const Padding(
                    padding: PAD_SYM_H12,
                    child: BaseShimmer(
                        child: SizedBox(
                      height: 150,
                      width: double.infinity,
                    )),
                  );
                } else {
                  return SizedBox(
                    height: 156,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listProducts.length,
                      itemBuilder: (context, index) {
                        final SavingProduct product =
                            controller.listProducts[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => controller.onSelected(product),
                          child: _ProductCell(
                            product: product,
                            index: index,
                            isSelected:
                                product.id == controller.selectedProduct!.id,
                          ),
                        );
                      },
                    ),
                  );
                }
              })
            ]));
  }
}

class _ProductCell extends StatelessWidget {
  final int index;
  final SavingProduct product;
  final bool isSelected;
  const _ProductCell(
      {Key? key,
      required this.product,
      this.index = 0,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = product.fullName;
    final inrest = product.coreInterest;
    return Padding(
      padding: EdgeInsets.only(right: 12, left: index == 0 ? 16 : 0),
      child: ClipRRect(
        borderRadius: BOR_RAD8,
        child: Stack(
          children: [
            SizedBox(
              width: 156,
              height: 156,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 90),
                    child: Center(
                      child: Image.network(product.thumb!, fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: PAD_SYM_H8,
                      child: Center(
                        widthFactor: 1,
                        child: RichText(
                          text: TextSpan(
                              text: title,
                              style: context.textSize14.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF333333)),
                              children: [
                                const TextSpan(text: "\n"),
                                if (inrest != null)
                                  TextSpan(
                                      text: "Lãi suất $inrest%/năm",
                                      style: context.textSize12.copyWith(
                                          color: context.disabledColor))
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 156,
              height: 156,
              decoration: BoxDecoration(
                  borderRadius: BOR_RAD8,
                  border: Border.all(
                      color: isSelected ? context.primaryColor : BOR_COLOR)),
            ),
          ],
        ),
      ),
    );
  }
}
