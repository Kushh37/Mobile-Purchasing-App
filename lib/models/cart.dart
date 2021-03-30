import 'package:demo1/core/store.dart';
import 'package:demo1/models/demoapp.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //demo Field
  DemoModel _demo;

  //Colltions of Ids -Store ids of each items
  final List<int> _itemids = [];
  DemoModel get demo => _demo;

  //Get Demo
  set demo(DemoModel newDemo) {
    assert(newDemo != null);
    _demo = newDemo;
  }

  //Get items by id
  List<Item> get items => _itemids.map((id) => _demo.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store.cart._itemids.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemids.remove(item.id);
  }
}
