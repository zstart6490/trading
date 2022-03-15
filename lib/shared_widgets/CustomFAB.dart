import 'package:flutter/material.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';


class MenuItem {
  final Widget child;
  final VoidCallback onTap;
  final TextStyle? labelStyle;
  final String label;
  final Color? titleColor;

  MenuItem({
    required this.child,
    required this.onTap,
    this.labelStyle,
    required this.label,
    this.titleColor,
  });
}

class CustomFAB extends StatelessWidget {
  const CustomFAB({Key? key, required this.children, this.hasBottomBar = false})
      : super(key: key);
  final bool hasBottomBar;
  final List<MenuItem> children;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ic_support_tag',
      child: PhysicalModel(
        color: Colors.black45,
        elevation: 10,
        shape: BoxShape.circle,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(FABOverlay(children, hasBottomBar));
          },
          child: ClipOval(
            child: ColoredBox(
              color: Colors.white,
              child: Image.asset(
                "assets/images/png/ic_support.png",
                fit: BoxFit.fill,
                width: 56,
                height: 56,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FABOverlay extends ModalRoute<void> {
  final List<MenuItem> items;
  final bool hasBottomBar;
  // ignore: avoid_positional_boolean_parameters
  FABOverlay(this.items, this.hasBottomBar);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    final mq = MediaQuery.of(context);

    final itemAnim = Tween(begin: 0.0, end: 66.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
      ),
    );
    final double bottomHeight =
        hasBottomBar ? kBottomNavigationBarHeight + 1.0 : 0.0;
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Container(
          width: mq.size.width,
          height: mq.size.height,
          padding: EdgeInsets.only(right: 16.0, bottom: 16.0 + bottomHeight),
          child: AnimatedBuilder(
            animation: itemAnim,
            builder: (context, child) => Stack(
                alignment: Alignment.bottomRight,
                fit: StackFit.expand,
                children: List<Widget>.generate(items.length, (index) {
                  final item = items[index];
                  return Positioned(
                    bottom: itemAnim.value * (items.length - index - 1),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            item.label,
                            textScaleFactor: 1,
                            style: item.labelStyle ?? context.textSize18,
                          ),
                          SIZED_BOX_W06,
                          FloatingActionButton(
                            heroTag: "tag$index",
                            onPressed: item.onTap,
                            child: item.child,
                          ),
                        ]),
                  );
                })
                // ..add(
                //   Positioned(
                //     bottom: 0,
                //     child: FloatingActionButton(
                //       heroTag: "homeMain",
                //       child: Transform(
                //           transform: new Matrix4.rotationZ(
                //               animation.value * 0.5 * 3.14),
                //           alignment: FractionalOffset.center,
                //           child: Icon(Icons.close)),
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //     ),
                //   ),
                // ),
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
