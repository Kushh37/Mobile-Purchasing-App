import 'dart:convert';
import 'package:demo1/Utils/routes.dart';
import 'package:demo1/core/store.dart';
import 'package:demo1/models/cart.dart';
import 'package:demo1/models/demoapp.dart';
import 'package:demo1/widgets/home_widgets/demo_header.dart';
import 'package:demo1/widgets/home_widgets/demo_list.dart';
import 'package:demo1/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/6262b0bbbc312b30ebeb60bc";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final demoappJson =
    //     await rootBundle.loadString("assets/files/demoapp.json");
    final response = await http.get(Uri.parse(url));
    final demoappJson = response.body;

    final decodedData = jsonDecode(demoappJson);
    var productsData = decodedData["products"];
    DemoModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: MyTheme.darkBluishColor,
            child: Icon(CupertinoIcons.cart),
          ).badge(
              color: Vx.gray200,
              size: 20,
              count: _cart.items.length,
              textStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DemoHeader(),
                if (DemoModel.items != null && DemoModel.items.isNotEmpty)
                  DemoList().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
