import 'package:demo1/models/cart.dart';
import 'package:demo1/models/demoapp.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  DemoModel demo;
  CartModel cart;

  MyStore() {
    demo = DemoModel();
    cart = CartModel();

    cart.demo = demo;
  }
}
