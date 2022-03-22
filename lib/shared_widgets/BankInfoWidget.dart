import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';

class BankInfoWidget extends StatelessWidget {
  const BankInfoWidget(
      {Key? key,
      this.borderColor,
      required this.imageUrl,
      required this.accountName,
      required this.codeBank,
      required this.accountNo,
      this.trailing})
      : super(key: key);
  final Color? borderColor;
  final String? imageUrl;
  final String? accountName;
  final String? accountNo;
  final String? codeBank;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BOR_RAD8,
            border: Border.all(color: borderColor ?? context.primaryColor)),
        child: Padding(
          padding: PAD_ALL12,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl!,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(accountName ?? "",
                              style: context.textSize14
                                  .copyWith(fontWeight: FontWeight.w500)),
                          SIZED_BOX_H04,
                          Row(
                            children: [
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 100),
                                child: Text(codeBank ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textSize12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF858585))),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                color: const Color(0xFFD6D6D6).withOpacity(0.5),
                                width: 1,
                                height: 14,
                              ),
                              Text(accountNo ?? "",
                                  style: context.textSize12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF858585))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: trailing,
                ),
            ],
          ),
        ));
  }
}
