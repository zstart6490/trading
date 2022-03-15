import 'package:flutter/material.dart';
import 'package:trading_module/shared_widgets/DashLine.dart';
import 'package:trading_module/shared_widgets/Painter/ClipperShadow.dart';
import 'package:trading_module/shared_widgets/Painter/RevertBorderClipper.dart';


class MainSeparator extends StatelessWidget {
  const MainSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: 18,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipShadow(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ],
                clipper: RevertBorderClipper(),
                child: Container(
                  color: Colors.white,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: DashLine(),
            ),
          ],
        ),
      ),
    );
  }
}
