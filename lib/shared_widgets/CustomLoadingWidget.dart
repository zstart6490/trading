import 'package:flutter/material.dart';
import 'package:trading_module/utils/extensions.dart';


class CustomLoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 12,
              ),
            ),
            const SizedBox(height: 20,),
            Text("Loading ...",
              style: context.textSize16.copyWith(fontWeight: FontWeight.bold, color: const Color(0xff333333)),
            )
          ],
        ),
      )
    );
  }
}
