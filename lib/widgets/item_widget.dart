import 'package:flutter/material.dart';
import 'package:demo1/models/demoapp.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: (){
          print("${item.name} Pressed.");
        },
        minLeadingWidth: 20,
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.company),
        trailing: Text("Rs${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
