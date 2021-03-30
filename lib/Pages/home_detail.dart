import 'package:demo1/models/demoapp.dart';
import 'package:demo1/widgets/home_widgets/add_to_cart.dart';
import 'package:demo1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  final Item demo;

  const HomeDetail({Key key, @required this.demo})
      : assert(demo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "Rs. ${demo.price}".text.bold.xl4.red800.make(),
              AddToCart(
                demo: demo,
              ).wh(120, 50),
            ],
          ).p32(),
        ),
        body: Column(
          children: [
            Image.network(demo.image).h32(context),
            Expanded(
                child: VxArc(
              height: 40.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    demo.name.text.xl4.color(MyTheme.darkBluishColor).make(),
                    demo.company.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Hello This is Heet Patel and this data is for dummy Text.Hello This is Heet Patel and this data is for dummy Text."
                        .text
                        .textStyle(context.captionStyle)
                        .xl
                        .make()
                  ],
                ).p64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
