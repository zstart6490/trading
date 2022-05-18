
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:trading_module/shared_widgets/CustomButton.dart';
import 'package:trading_module/utils/extensions.dart';

class CustomErrorWidget extends StatelessWidget{
  VoidCallback? onPressRetry;
  CustomErrorWidget({Key? key, this.onPressRetry}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Icon( Icons.info_outline,
              size: 150,
              color: Color(0xFF9AA0A5),
            ),
            Text("Error loading",
              style: context.textSize16.copyWith(fontWeight: FontWeight.bold,color: const Color(0xff333333)),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                if (onPressRetry != null){
                  onPressRetry!();
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                decoration: BoxDecoration(color: const Color(0xFFF46666), borderRadius: BorderRadius.circular(8)),
                child: Text("Try again",
                  style: context.textSize18.copyWith(color: Colors.white),),
              ),
            ),


          ],
        ),
      )
    );
  }
}