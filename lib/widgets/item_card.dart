import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summer_limonad/models/product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(int.parse(product.color)),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
                GestureDetector(
                  onTap: (){},
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(product.imgUrl), fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: Text(
                        '${product.title}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
            ),
                ),


        ],
      ),
    );
  }
}
