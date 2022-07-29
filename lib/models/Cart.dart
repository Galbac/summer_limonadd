//Cart Model
import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  Cart({
    required this.id,
    required this.title,
    required this.number,
    required this.price,
    required this.imgUrl,
  });
}

//Cart Provider
class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems => UnmodifiableMapView(
      _cartItems); //UnmodifiableMapView - Неизменяемый вид карты

  int get cartItemsCount => _cartItems.length; //Длина (кол-во штук) корзины

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.number;
    }); //Какая сумма в корзине
    return total;
  }

//Добавлять в корзину

  void addItem({productId, title, price, imgUrl}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (ex) => Cart(
                id: ex.id,
                title: ex.title,
                number: ex.number + 1,
                price: ex.price,
                imgUrl: ex.imgUrl,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
                id: '${DateTime.now()}',
                title: title,
                number: 1,
                price: price,
                imgUrl: imgUrl,
              ));
    }
    notifyListeners();
  }

  //Удалять с корзины

  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  //Обновить корзину на +1 единицу товаров по id

void updateItemsAddOne(String productId){
    _cartItems.update(productId, (ex) => Cart(
      id: ex.id,
      title: ex.title,
      number: ex.number + 1,
      price: ex.price,
      imgUrl: ex.imgUrl,
    ));
    notifyListeners();
}

//Обновить корзину на -1 единицу товаров по id

void updateItemsSubOne(String productId){
    if(_cartItems[productId]!.number < 2){
      deleteItem(productId);
    }else{
      _cartItems.update(productId, (ex) => Cart(
        id: ex.id,
        title: ex.title,
        number: ex.number - 1,
        price: ex.price,
        imgUrl: ex.imgUrl,
      ));
    }
    notifyListeners();
}

//Очищаем корзину

void clear(){
    _cartItems = {};
    notifyListeners();
}

}
