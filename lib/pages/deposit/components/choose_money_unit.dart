import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tikop/models/Currency.dart';
import 'package:tikop/shared_widgets/BaseBottomSheet.dart';
import 'package:tikop/utils/util.dart';

class ChooseMoneyUnit extends StatelessWidget {
  const ChooseMoneyUnit({Key? key, required this.data, this.onSelected})
      : super(key: key);

  final List<Currency> data;
  final Function(Currency)? onSelected;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return BaseBottomSheet(
        title: "Chọn tiền tệ",
        height: mediaQuery.size.height * 0.6,
        child: Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final currency = data[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: currency.avtCountry!,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 40,
                  height: 40,
                ),
                title: Text(
                  currency.name ?? "",
                  style: context.textSize14.copyWith(
                      color: context.disabledColor,
                      fontWeight: FontWeight.w500),
                ),
                trailing: SizedBox(
                  width: 50,
                  child: Text(
                    currency.moneyCode ?? "",
                    style: context.textSize14
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                onTap: () => onSelected?.call(currency),
              );
            },
          ),
        ));
  }
}
