import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:trading_module/pages/pdf_reader/pdf_reader_controller.dart';
import 'package:trading_module/shared_widgets/BaseScaffold.dart';

class PdfReadePager extends GetView<PdfReaderController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar<PdfReaderController>(
        backgroundColor: Colors.white,
        title: controller.title,
        body: controller.obx((state) =>  PdfViewPinch(
              controller: state!,
              builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                options: const DefaultBuilderOptions(
                  transitionBuilder: transitionBuilder,
                ),
                documentLoaderBuilder: (_) =>
                    const Center(child: CircularProgressIndicator()),
                pageLoaderBuilder: (_) =>
                    const Center(child: CircularProgressIndicator()),
                errorBuilder: (_, error) =>
                    Center(child: Text(error.toString())),
                builder: builder,
              ),
            )));
  }

  static Widget transitionBuilder(Widget child, Animation<double> animation) =>
      FadeTransition(opacity: animation, child: child);

  static Widget builder(
    BuildContext context,
    PdfViewPinchBuilders builders,
    PdfLoadingState state,
    WidgetBuilder loadedBuilder,
    PdfDocument? document,
    Exception? loadingError,
  ) {
    final Widget content = () {
      switch (state) {
        case PdfLoadingState.loading:
          return KeyedSubtree(
            key: const Key('pdfx.root.loading'),
            child: builders.documentLoaderBuilder?.call(context) ??
                const SizedBox(),
          );
        case PdfLoadingState.error:
          return KeyedSubtree(
            key: const Key('pdfx.root.error'),
            child: builders.errorBuilder?.call(context, loadingError!) ??
                Center(child: Text(loadingError.toString())),
          );
        case PdfLoadingState.success:
          return KeyedSubtree(
            key: Key('pdfx.root.success.${document!.id}'),
            child: loadedBuilder(context),
          );
      }
    }();

    final defaultBuilder =
        builders as PdfViewPinchBuilders<DefaultBuilderOptions>;
    final options = defaultBuilder.options;

    return AnimatedSwitcher(
      duration: options.loaderSwitchDuration,
      transitionBuilder: options.transitionBuilder,
      child: content,
    );
  }
}
