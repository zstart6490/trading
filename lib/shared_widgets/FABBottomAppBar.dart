import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/utils/extensions.dart';


class FABBottomAppBarItem {
  FABBottomAppBarItem({
    required this.title,
    required this.inActivePath,
    required this.activePath,
    this.badge,
  });

  final String title;
  final String inActivePath;
  final String activePath;
  final RxInt? badge;
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({
    required this.items,
    required this.controller,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    required this.color,
    required this.selectedColor,
    this.notchedShape,
    required this.activeStyle,
    required this.inActiveStyle,
    required this.onTabSelected,
    required this.badgeStyle,
  }) : assert(items.length == 2 || items.length == 4);

  final TabController controller;
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color color;
  final Color selectedColor;
  final TextStyle activeStyle;
  final TextStyle inActiveStyle;
  final TextStyle badgeStyle;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  late TabController controller;
  late int _selectedIndex;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    controller = widget.controller;
    _selectedIndex = controller.index;
    controller.addListener(() {
      setState(() {
        _selectedIndex = controller.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        context: context,
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: widget.inActiveStyle,
              textScaleFactor: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required BuildContext context,
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    final bool isActive = _selectedIndex == index;
    final Color color = isActive ? widget.selectedColor : widget.color;
    return Expanded(
        child: SizedBox(
      height: widget.height,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () => onPressed(index),
          behavior: HitTestBehavior.translucent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                        isActive ? item.activePath : item.inActivePath),
                    Text(
                      item.title,
                      textScaleFactor: 1,
                      style: isActive
                          ? widget.activeStyle.copyWith(color: color)
                          : widget.inActiveStyle.copyWith(color: color),
                    )
                  ],
                ),
              ),
              if (item.badge != null)
                Obx(() => item.badge! > 0
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 36, left: 20),
                        constraints: const BoxConstraints(
                            maxHeight: 20,
                            minHeight: 20,
                            minWidth: 20,
                            maxWidth: 40),
                        decoration: const BoxDecoration(
                            borderRadius: BOR_RAD12, color: Colors.red),
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          item.badge.toString(),
                          softWrap: true,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style:
                              context.textSize11.copyWith(color: Colors.white),
                        ))
                    : const SizedBox())
            ],
          ),
        ),
      ),
    ));
  }
}
