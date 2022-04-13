import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/utils/extensions.dart';

/// An Scaffold with customed AppBar
/// [tag] GetX Controller Key
///
/// [title] AppBar title
///
/// [actions] AppBar button actions
///
/// [body] Widget body of scaffold
///
/// [fab] FloatingActionButton
///
/// [fabLocation] floatingActionButtonLocation
class BaseScaffoldAppBar<T extends BaseController> extends StatelessWidget {
  const BaseScaffoldAppBar({
    Key? key,
    required this.title,
    required this.body,
    this.actions,
    this.fab,
    this.fabLocation,
    this.tag,
    this.showBackBtn = true,
    this.backgroundColor,
    this.elevation,
    this.leading,
    this.safeAreaBottom = true,
  }) : super(key: key);
  final String title;
  final List<Widget>? actions;
  final String? tag;
  final Widget body;
  final Widget? fab;
  final Widget? leading;
  final bool showBackBtn;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? fabLocation;
  final double? elevation;
  final bool safeAreaBottom;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: WillPopScope(
          onWillPop: controller.onWillPop,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: fab,
            floatingActionButtonLocation:
            fabLocation ?? FloatingActionButtonLocation.endFloat,
            appBar: AppBar(
              title: Text(
                title,
                style: context.textSize18,
              ),
              leading: leading,
              actions: actions,
              automaticallyImplyLeading: showBackBtn,
              elevation:
              elevation ?? Theme.of(context).appBarTheme.elevation ?? 1.0,
            ),
            backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
            body: SafeArea(
              bottom: safeAreaBottom,
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => controller.hideKeyboard(),
                  child: body),
            ),
          ),
        ));
  }
}

/// An custom Scaffold without AppBar
/// [tag] GetX Controller Key
///
/// [body] Widget body of scaffold
///
/// [fab] FloatingActionButton
///
/// [fabLocation] floatingActionButtonLocation
class BaseScaffold<T extends BaseController> extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    required this.body,
    this.fab,
    this.fabLocation,
    this.tag,
    this.backgroundColor,
  }) : super(key: key);
  final String? tag;
  final Widget body;
  final Widget? fab;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? fabLocation;

  T get controller => GetInstance().find<T>(tag: tag);
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: WillPopScope(
          onWillPop: controller.onWillPop,
          child: Scaffold(
            backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
            body: SafeArea(
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => controller.hideKeyboard(),
                  child: body),
            ),
            floatingActionButton: fab,
            floatingActionButtonLocation: fabLocation,
          ),
        ));
  }
}
