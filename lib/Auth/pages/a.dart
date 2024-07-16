// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:stacked_card_carousel/stacked_card_carousel.dart';

// class HomePageaaa extends StatelessWidget {
//   const HomePageaaa({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.menu),
//         title: const Text('Grand News'),
//         centerTitle: true,
//         actions: const [
//           Icon(Icons.search),
//           SizedBox(width: 10),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bookmark), label: 'Bookmarks'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           height: 500,
//           child: ListView(
//             children: [
//               const SizedBox(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('All', style: TextStyle(fontWeight: FontWeight.bold)),
//                     Text('Politics'),
//                     Text('Sports'),
//                     Text('Health'),
//                     Text('Tech'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               StackedCardCarousel(
//                 items: const [
//                   CardItem(
//                     image: AssetImage('assets/t.png'),
//                     title:
//                         'KKR players flock Instagram as Phil Salt leaves IPL for Pakistan series and T20 World Cup',
//                   ),
//                   CardItem(
//                     image: AssetImage('assets/t.png'),
//                     title:
//                         'KKR players flock Instagram as Phil Salt leaves IPL for Pakistan series and T20 World Cup',
//                   ),
//                   CardItem(
//                     image: AssetImage('assets/t.png'),
//                     title:
//                         'KKR players flock Instagram as Phil Salt leaves IPL for Pakistan series and T20 World Cup',
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Latest News',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text('See More', style: TextStyle(color: Colors.blue)),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 300,
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: const [
//                     NewsItemaa(
//                       title:
//                           'Maharashtra Board Result 2024 Live Check updates on official MSBSHSE HSC SSC result dates',
//                       category: 'Education',
//                       image: AssetImage('assets/t.png'),
//                     ),
//                     NewsItemaa(
//                       title:
//                           'Indian-American entrepreneur Vivek Ramaswamy files for 2024 US presidential bid',
//                       category: 'Politics',
//                       image: AssetImage('assets/t.png'),
//                     ),
//                     NewsItemaa(
//                       title: 'Pakistan floods: A year into catastrophe',
//                       category: 'World',
//                       image: AssetImage('assets/t.png'),
//                     ),
//                     NewsItemaa(
//                       title:
//                           'Russia\'s Lavrov: Ties with the West are now over',
//                       category: 'World',
//                       image: AssetImage('assets/t.png'),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CardItem extends StatelessWidget {
//   final ImageProvider image;
//   final String title;

//   const CardItem({super.key, required this.image, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: image,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           left: 10,
//           child: Container(
//             color: Colors.black.withOpacity(0.5),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class NewsItemaa extends StatelessWidget {
//   final String title;
//   final ImageProvider image;
//   final String category;

//   const NewsItemaa(
//       {super.key,
//       required this.title,
//       required this.category,
//       required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             height: 80,
//             color: Colors.grey[300], // يمكنك استبدال هذا بصورة مصغرة
//             child: Center(child: Image(image: image)),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(category),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
