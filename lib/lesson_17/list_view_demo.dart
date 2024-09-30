//! ListView
//? ListView là widget cuộn dọc cho phép hiển thị một danh sách các widget con.
//? Nó tự động tạo và hủy các phần tử không hiển thị để tiết kiệm bộ nhớ.

//! Ứng dụng ListView trong thực tế
//?   - Danh sách tin nhắn trong ứng dụng chat:
//      Hiển thị các tin nhắn theo thứ tự thời gian.

//?   - Danh sách sản phẩm trong cửa hàng:
//      Hiển thị các sản phẩm trong một cửa hàng trực tuyến.

//! ListView có 3 kiểu:
//?   - ListView:
//      Hiển thị một danh sách đơn giản các phần tử con.

//?   - ListView.builder:
//      Tạo một danh sách động bằng cách chỉ tạo phần tử khi chúng cần được hiển thị.
//      Hiệu quả hơn cho danh sách dài hoặc không xác định số lượng phần tử.

//?   - ListView.separated:
//      Tạo một danh sách có phân cách giữa các phần tử.
//      Sử dụng separatorBuilder để định nghĩa cách phân cách giữa các phần tử.

//! Ví Dụ 1: Danh Sách Cơ Bản
//?   - ListView:
//?      Hiển thị một danh sách đơn giản các phần tử con.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class BasicListView extends StatelessWidget {
  const BasicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        //? scrollDirection
        //  Xác định hướng cuộn của ListView.
        //  Mặc định là Axis.vertical (cuộn dọc).
        //  Có thể thiết lập thành Axis.horizontal để cuộn ngang.
        scrollDirection: Axis.horizontal,

        //? reverse
        //  Nếu true, danh sách sẽ cuộn ngược, tức là phần tử cuối cùng sẽ nằm ở đầu danh sách.
        // reverse: true,

        //? children: Danh sách các widget con của ListView
        children: const <Widget>[
          CardItem(value: "Container 1"),
          CardItem(value: "Container 2"),
          CardItem(value: "Container 3"),
          CardItem(value: "Container 4"),
          CardItem(value: "Container 5"),
          CardItem(value: "Container 6"),
          CardItem(value: "Container 7"),
          CardItem(value: "Container 8"),
          CardItem(value: "Container 9"),
          CardItem(value: "Container 10"),
          CardItem(value: "Container 11"),
          CardItem(value: "Container 12"),
          // Container(
          //   width: 500,
          //   height: 1200,
          //   color: Colors.amber,
          // ),
          // Container(
          //   width: 500,
          //   height: 1200,
          //   color: Colors.red,
          // ),
          // Container(
          //   width: 120,
          //   height: 200,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String value;
  const CardItem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    print("Build item $value");
    return Container(
      margin: const EdgeInsets.only(left: 12, bottom: 12),
      height: 200,
      color: Colors.amber,
      child: Text("Value is: $value"),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView Example')),
        body: const BasicListView(),
      ),
    );
  }
}

//! Ví Dụ 2: Danh Sách Với ListView.builder
//?   - ListView.builder:
//?      Tạo một danh sách động bằng cách chỉ tạo phần tử khi chúng cần được hiển thị.
//?      Hiệu quả hơn cho danh sách dài hoặc không xác định số lượng phần tử.
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class DynamicListView extends StatelessWidget {
//   final List<CardItem> listWeatherCard = [
//     const CardItem(value: "Ho Chi Minh City"),
//     const CardItem(value: "Da Nang City"),
//     const CardItem(value: "Hue City"),
//     const CardItem(value: "Ha noi City"),
//     const CardItem(value: "Cao Bang"),
//     const CardItem(value: "Long An"),
//   ];
//   DynamicListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       //? itemCount
//       //  Số lượng phần tử trong danh sách khi sử dụng ListView.builder
//       //  Đây là số lượng phần tử mà ListView sẽ tạo ra.
//       itemCount: listWeatherCard.length,
//       //? itemBuilder
//       //  Hàm để xây dựng các phần tử con trong danh sách khi sử dụng ListView.builder
//       itemBuilder: (context, index) {
//         return listWeatherCard[index];
//       },
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('ListView.builder Example')),
//         body: DynamicListView(),
//       ),
//     );
//   }
// }

//! Ví Dụ 3: Danh Sách Có Phân Cách
// ?   - ListView.separated:
// ?      Tạo một danh sách có phân cách giữa các phần tử.
// ?      Sử dụng separatorBuilder để định nghĩa cách phân cách giữa các phần tử.
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('ListView.separated Example')),
//         body: const SeparatedListView(),
//       ),
//     );
//   }
// }

// class SeparatedListView extends StatelessWidget {
//   const SeparatedListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: 50,
//       //? separatorBuilder
//       //  Hàm để xây dựng các phân cách giữa các phần tử
//       //  Hàm này nhận context và index làm tham số và trả về một widget phân cách (như Divider).
//       separatorBuilder: (context, index) {
//         // if (index % 2 == 0) {
//         //   return Container(
//         //     color: Colors.amber,
//         //     height: 20,
//         //   );
//         // }
//         // return const SizedBox.shrink();
//         return Container(
//           color: Colors.amber,
//           height: 20,
//         );
//       },
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('Item $index'),
//           onTap: () {},
//         );
//       },
//     );
//   }
// }
