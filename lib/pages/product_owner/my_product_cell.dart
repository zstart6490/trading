import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trading_module/domain/entities/product_own.dart';
import 'package:trading_module/domain/entities/stock_model.dart';
import 'package:trading_module/utils/extensions.dart';

class MyProductCell extends StatelessWidget {
  final ProductOwn productOwn;
  final VoidCallback onPressed;

  const MyProductCell({
    Key? key,
    required this.onPressed,
    required this.productOwn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const mediumStyle = TextStyle(
        fontFamily: 'iCielHelveticaNowText',
        color: Color(0xFF333333),
        fontSize: 14,
        fontWeight: FontWeight.w500);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onPressed.call(),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        decoration: BoxDecoration(
          color: context.backgroundColor,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xFFEBECED),
            ),
          ),
        ),
        child: SizedBox(
          height: 60,
          child: Row(children: [
            Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF9AA0A5),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: productOwn.fullLink.loadCacheImg(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 7.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          productOwn.symbol.toUpperCase(),
                          style: mediumStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          productOwn.stockName,
                          style: const TextStyle(
                              fontFamily: 'iCielHelveticaNowText',
                              color: Color(0xFF9AA0A5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                width: 70,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        productOwn.lastPrice.getPriceStock(),
                        style: mediumStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        productOwn.getRatioPercentage(),
                        style: TextStyle(
                            fontFamily: 'iCielHelveticaNowText',
                            color: (productOwn.lastPrice - productOwn.priceAvg)
                                .getStockColor(),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
