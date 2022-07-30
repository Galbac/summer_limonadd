import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summer_limonad/models/Cart.dart';
import 'package:summer_limonad/widgets/cart_list_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text("Корзинка счастья"),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5,
                margin: const EdgeInsets.all(30),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: const Text('Корзина пустая ;(',style: TextStyle(fontSize: 35,color: Colors.red),),
                ),
              )
            : Column(
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Стоимость ' + cartData.totalAmount.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 20),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: const Text('Купить'),
                      )
                    ],
                  ),
                  const Divider(),
                  Expanded(child: CartItemList(cartData: cartData)),
                ],
              ));
  }
}
