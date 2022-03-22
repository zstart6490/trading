import 'package:flutter/material.dart';
import 'package:trading_module/data/entities/naptien/SavingProduct.dart';
import 'package:trading_module/shared_widgets/BaseBottomSheet.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/util.dart';

class SwapProductBottomSheet extends StatefulWidget {
  final List<SavingProduct> products;
  final String currentProductId;
  final String movedProductId;
  final Function(SavingProduct)? onConfirm;
  const SwapProductBottomSheet({
    required this.products,
    required this.movedProductId,
    required this.currentProductId,
    this.onConfirm,
  });

  @override
  _SwapProductBottomSheetState createState() => _SwapProductBottomSheetState();
}

class _SwapProductBottomSheetState extends State<SwapProductBottomSheet> {
  late List<SavingProduct> listProduct;
  SavingProduct? selectedProduct;
  SavingProduct? currentProduct;
  @override
  void initState() {
    listProduct = widget.products;
    for (final p in listProduct) {
      if (p.id == widget.movedProductId) {
        selectedProduct = p;
      }
      if (p.id == widget.currentProductId) {
        currentProduct = p;
      }
    }

    if (currentProduct != null) {
      listProduct.remove(currentProduct);
      listProduct.insert(0, currentProduct!);
    }
    selectedProduct ??= listProduct.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const cellHeight = 38.0;
    final minHeight = 50.0 + 52.0 + 32.0 + context.viewPadding.bottom;
    final totalHeight = minHeight + listProduct.length * cellHeight;
    final column = Column(
      children: List.generate(listProduct.length, (index) {
        final product = listProduct[index];
        final bool isSame = product.id == widget.currentProductId;
        return SizedBox(
          height: cellHeight,
          child: InkWell(
            onTap: () => onTapped(product),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isSame
                        ? "Tự động gia hạn hợp đồng"
                        : "Chuyển sang ${product.fullName}",
                    style: context.textSize14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Radio<SavingProduct>(
                  activeColor: context.primaryColor,
                  value: product,
                  groupValue: selectedProduct,
                  onChanged: (index) => onTapped(index!),
                ),
              ],
            ),
          ),
        );
      }),
    );
    return BaseBottomSheet(
      title: "Phương thức tất toán",
      height: totalHeight,
      child: Expanded(
          child: Padding(
        padding: PAD_SYM_H16,
        child: Column(children: [
          column,
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: CustomButton.defaultStyle(
                title: "Xác nhận",
                onPressed: () => widget.onConfirm?.call(selectedProduct!)),
          ),
        ]),
      )),
    );
  }

  void onTapped(SavingProduct savingProduct) {
    setState(() {
      selectedProduct = savingProduct;
    });
  }
}
