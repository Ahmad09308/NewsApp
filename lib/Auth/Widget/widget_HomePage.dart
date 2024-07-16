import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final ImageProvider image;
  final String title;

  const CardItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266,
      height: 338,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: Text(title),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String category;

  const NewsItem(
      {super.key,
      required this.title,
      required this.category,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            color: Colors.grey[300], 
            child: Center(child: Image(image: image)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(category),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
