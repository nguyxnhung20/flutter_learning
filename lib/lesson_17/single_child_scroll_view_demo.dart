//! SingleChildScrollView
//? SingleChildScrollView là widget cho phép cuộn nội dung
//  khi nội dung vượt quá kích thước của viewport.
//  Nó chỉ hỗ trợ một phần tử con duy nhất
//  nhưng phần tử này có thể là một widget chứa nhiều phần tử con khác, vd: Column, Row.

//? SingleChildScrollView có các property thường gặp như:
// - physics
// - reverse
// - padding
// - scrollDirection

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SingleChildScrollView Example')),
        body: const SizedBox(
            // color: Colors.amber,
            width: double.infinity,
            height: double.infinity,
            child: ScrollableContent()),
      ),
    );
  }
}

class ScrollableContent extends StatelessWidget {
  const ScrollableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //? Hướng cuộn của danh sách
      scrollDirection: Axis.horizontal,
      //? BouncingScrollPhysics (ios)
      //? ClampingScrollPhysics (android)
      //? AlwaysScrollableScrollPhysics
      //? NeverScrollableScrollPhysics
      // padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Row(
        children: List.generate(
          20,
          (index) => Container(
            color: Colors.black,
            margin: const EdgeInsets.only(right: 20),
            child: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
