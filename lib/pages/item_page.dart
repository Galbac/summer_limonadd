import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:summer_limonad/models/Cart.dart';
import 'package:summer_limonad/models/product.dart';
import 'package:summer_limonad/pages/cart_page.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  const ItemPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementByID(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.imgUrl), fit: BoxFit.cover),
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(fontSize: 26),
                    ),
                    const Divider(color: Colors.grey,thickness: 1),
                    Row(
                      children: [
                        const Text(
                          "Цена: ",
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          "${data.price}",
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(data.description),
                    const SizedBox(
                      height: 20,
                    ),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(productId)
                        ? Column(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const CartPage(),
                                    ),
                                  );
                                },
                                color: const Color(0xFFCCFF90),
                                child: const Text("Перейти в корзину"),
                              ),
                              const Text(
                                'Товар уже добавлен в корзину',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey),
                              ),
                            ],
                          )
                        : MaterialButton(
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                imgUrl: data.imgUrl,
                                price: data.price,
                                productId: data.id,
                                title: data.title,
                              );
                            },
                      color:Theme.of(context).primaryColor,
                            child: const Text('Добавить в корзину'),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
