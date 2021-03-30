import 'package:demo1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DemoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Vx.m8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Device Purchasing App".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
          "Stay Digital :)".text.xl.make(),
        ],
      ),
    );
  }
}
