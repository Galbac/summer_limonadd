import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summer_limonad/models/product.dart';
import 'package:summer_limonad/widgets/catalog.dart';
import 'package:summer_limonad/widgets/item_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: ListView(
            children: [
              Container(
                child: const ListTile(
                  title: Text(
                    "Освежающие напитки",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                  subtitle: Text(
                    "Больше чем 100 видов напитков",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 290,
                child: ListView.builder(
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                    value: productData.items[index],
                    child: const ItemCard(),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Каталог коктейлей"),
              ),
              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
