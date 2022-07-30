import 'package:flutter/material.dart';

class ItemCatalog extends StatelessWidget {
  final String imgUrl;

  const ItemCatalog({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Католог коктейлей'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          childAspectRatio: 1,
          children: [
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String imgUrl) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Colors.lime,
        ),
        child: const Text(
          "Коктейль",
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              backgroundColor: Colors.black45),
        ),
      );
}
