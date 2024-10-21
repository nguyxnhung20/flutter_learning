import 'package:flutter/material.dart';

class BodySection extends StatelessWidget {
  final PageController pageview1Controller;

  final List<Container> pageViewOneChildren;
  final PageController pageview2Controller;
  final List<Container> pageViewTwoChildren;
  const BodySection({
    super.key,
    required this.pageview1Controller,
    required this.pageViewOneChildren,
    required this.pageview2Controller,
    required this.pageViewTwoChildren,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageview1Controller,
            children: pageViewOneChildren,
          ),
        )),
        Expanded(
            child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageview2Controller,
            children: pageViewTwoChildren,
          ),
        )),
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
        Container(
          color: Colors.green,
          width: double.infinity,
          height: 10,
        )
      ],
    );
  }
}
