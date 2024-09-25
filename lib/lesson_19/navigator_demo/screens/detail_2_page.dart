import 'package:flutter/material.dart';

class DetailPage2 extends StatelessWidget {
  const DetailPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close the current screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop("hello Screen 1");
                },
                child: const Text(
                    "Close the current screen and send data back to previous screen"))
          ],
        ), // Hiển thị tham số nhận được
      ),
    );
  }
}
