import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tikop/utils/util.dart';

class BankIcon extends StatelessWidget {
  final String bankIcon;
  final String bankName;
  final VoidCallback? onTapped;
  final bool isSelected;
  const BankIcon({
    Key? key,
    required this.bankIcon,
    required this.bankName,
    this.onTapped,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 90),
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => onTapped?.call(),
          child: Column(
            children: [
              ClipOval(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.transparent : Colors.grey,
                    BlendMode.color,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: bankIcon,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              SIZED_BOX_H06,
              Text(
                bankName,
                textScaleFactor: 1,
                style: context.textSize12.copyWith(
                  color:
                      isSelected ? context.primaryColor : context.disabledColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
