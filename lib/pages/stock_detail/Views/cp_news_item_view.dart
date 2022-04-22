import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';
import 'package:trading_module/shared_widgets/Dot.dart';
import 'package:trading_module/utils/extensions.dart';

class CompanyNewsItemView extends StatelessWidget {
  final CompanyNewsModel news;

  const CompanyNewsItemView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                news.source.sourceName,
                style: context.textSize14,
              ),
              SIZED_BOX_W08,
              const Dot(
                size: 3,
                color: Colors.grey,
              ),
              SIZED_BOX_W08,
              Text(
                "15/2/2022",
                style: context.textSize14.copyWith(color: Colors.grey),
              )
            ],
          ),
          SIZED_BOX_H12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://vnn-imgs-f.vgcloud.vn/2022/01/04/15/1-1.jpg",
                  width: 114,
                  height: 80,
                ),
              ),
              SIZED_BOX_W12,
              Expanded(
                  child: Text(
                news.title,
                style: context.textSize16.copyWith(fontWeight: FontWeight.w700),
              )),
            ],
          )
        ],
      ),
    );
  }
}
