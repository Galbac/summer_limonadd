import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const Text("Горизонтальный список карточек"),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("Каталог коктейлей"),
              ),
              const Text("Список каталогов"),
            ],
          ),
        ),
      ),
    );
  }
}
