import 'package:flutter/material.dart';

Widget headlineConstruct(
    {required String title, required double width, double? fontsize}) {
  return Row(
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: fontsize ?? 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 2,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ],
  );
}
