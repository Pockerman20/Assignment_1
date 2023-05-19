import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget productCarouselSlider(List<String>? images,
    {Function(int, CarouselPageChangedReason)? onPageChanged}) {
  return CarouselSlider.builder(
    itemCount: images!.length,
    itemBuilder: (context, index, realIndex) {
      return Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: Card(
                      margin: const EdgeInsets.fromLTRB(10, 100, 10, 100),
                      child: Image.network(
                        images[index],
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                images[index],
                fit: BoxFit.contain,
                width: double.infinity,
                height: 350,
              ),
            ),
          ),
        ],
      );
    },
    options: CarouselOptions(
      enableInfiniteScroll: true,
      viewportFraction: 1,
      aspectRatio: 1,
      autoPlayInterval: const Duration(seconds: 3),
      onPageChanged: onPageChanged,
    ),
  );
}

















// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// Widget productCarouselSlider(List<String>? images) {
//   return CarouselSlider.builder(
//     itemCount: images!.length,
//     itemBuilder: (context, index, realIndex) {
//       int _currentIndex = 0;
//       return Stack(
//         fit: StackFit.expand,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => Scaffold(
//                     body: Card(
//                       margin: const EdgeInsets.fromLTRB(10, 100, 10, 100),
//                       child: Image.network(
//                         images[index],
//                         width: double.infinity,
//                         height: 300,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 images[index],
//                 fit: BoxFit.contain,
//                 width: double.infinity,
//                 height: 350,
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//     options: CarouselOptions(
//       enableInfiniteScroll: true,
//       viewportFraction: 1,
//       aspectRatio: 1,
//       autoPlayInterval: const Duration(seconds: 3),
//     ),
//   );
// }
