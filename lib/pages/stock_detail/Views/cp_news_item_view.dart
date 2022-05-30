import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/domain/entities/company_news_model.dart';
import 'package:trading_module/shared_widgets/Dot.dart';
import 'package:trading_module/utils/date_utils.dart';
import 'package:trading_module/utils/extensions.dart';

class CompanyNewsItemView extends StatelessWidget {
  final CompanyNewsModel news;

  const CompanyNewsItemView({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: InkWell(
          onTap: () {
            _launchURL(context, news.url);
          },
          child: Column(
            children: [
              Row(
                children: [
                  if (news.source.sourceName.isNotEmpty)
                    Text(
                      news.source.sourceName,
                      style: context.textSize14,
                    ),
                  SIZED_BOX_W08,
                  if (news.source.sourceName.isNotEmpty)
                    const Dot(
                      size: 3,
                      color: Colors.grey,
                    ),
                  if (news.source.sourceName.isNotEmpty) SIZED_BOX_W08,
                  if (news.createTime.isNotEmpty)
                    Text(
                      news.createTime
                          .toDateFormat(DateFormater.yyyyMMddHHmmss)
                          .toStringFormat(DateFormater.ddMMYYYY),
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
                    child: news.fullImgUrl.loadCacheImg(mWidth: 113, mHeight: 80),
                  ),
                  SIZED_BOX_W12,
                  Expanded(
                      child: Text(
                    news.title,
                    style: context.textSize16
                        .copyWith(fontWeight: FontWeight.w700),
                  )),
                ],
              )
            ],
          ),
        ));
  }

  Future _launchURL(BuildContext context, String url) async {
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
