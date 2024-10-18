import 'package:flutter/material.dart';
import 'package:flutter_learning/lesson_19/navigator_demo/routes_constant.dart';

class DetailPage extends StatefulWidget {
  final String data;

  const DetailPage({super.key, required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail 1 Page'),
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.data),
            ElevatedButton(
                onPressed: () async {
                  final resultFromDetailScreen2 = await Navigator.of(context)
                      .pushNamed(detailScreen2Route) as String?;

                  if (resultFromDetailScreen2 != null) {
                    setState(() {
                      data = resultFromDetailScreen2;
                    });
                  }
                },
                child: const Text('Go to Detail Screen 2')),
            //! Sử Dụng pushReplacementNamed
            //?  Thay thế màn hình hiện tại bằng một màn hình mới.
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(detailScreen2Route);
                },
                child: const Text(
                    'Go to Detail Screen 2 using pushReplacementNamed')),
            //! Sử Dụng pushNamedAndRemoveUntil
            //? Mở một màn hình mới
            //? và xóa tất cả các màn hình phía dưới
            //? cho đến khi một màn hình nhất định được tìm thấy.
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    detailScreen2Route,
                    (Route<dynamic> route) => false, // Xóa tất cả các route
                  );
                },
                child: const Text(
                    'Go to Detail Screen 2 using pushNamedAndRemoveUntil')),
            const SizedBox(
              height: 15,
            ),
            Text("Message nhận từ Screen 2 là: $data")
          ],
        ), // Hiển thị tham số nhận được
      ),
    );
  }
}
