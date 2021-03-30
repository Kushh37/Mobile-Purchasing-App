//import 'package:demo1/Pages/HomePage.dart';
import 'package:demo1/Pages/home_detail.dart';
import 'package:demo1/models/demoapp.dart';
import 'package:demo1/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'demo_image.dart';

class DemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: DemoModel.items.length,
        itemBuilder: (context, index) {
          final demo = DemoModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetail(
                        demo: demo,
                      ),
                    ),
                  ),
              child: DemoItem(demo: demo));
        });
  }
}

class DemoItem extends StatelessWidget {
  final Item demo;

  const DemoItem({Key key, @required this.demo})
      : assert(demo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        DemoImage(image: demo.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            demo.name.text.lg.color(MyTheme.darkBluishColor).make(),
            demo.company.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "Rs. ${demo.price}".text.bold.lg.make(),
                AddToCart(demo: demo)
              ],
            ).pOnly(right: 16.0)
          ],
        ))
      ],
    )).white.rounded.square(130).make().py16();
  }
}
