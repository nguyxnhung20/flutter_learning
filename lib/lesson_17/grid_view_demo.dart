//! GridView là gì?
//? GridView hiển thị một danh sách theo cả chiều dọc và chiều ngang

//? Các phần tử có trong GridView sẽ hiển thị  theo dạng lưới.

//? Trong GridView, bạn cần chú ý về các khái niệm:
//    - Main Axis: là trục cùng phương với ScrollDirection
//    - Cross Axis: là trục vuông góc với ScrollDirection

//! Các Loại GridView phổ biến

//?  1. GridView:
//      Hiển thị một lưới các phần tử con theo cấu hình lưới
//      được xác định bởi gridDelegate.

//?  2. GridView.builder:
//      Tạo lưới động bằng cách chỉ tạo phần tử khi chúng cần được hiển thị.
//      Thích hợp cho các lưới có số lượng phần tử không xác định.

//! Ví Dụ 1: Lưới Cơ Bản
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class BasicGridView extends StatelessWidget {
//   const BasicGridView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       //? SliverGridDelegateWithFixedCrossAxisCount
//       //  Đặt số cột cố định trong lưới.
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, // Số cột
//         crossAxisSpacing: 4.0, // Khoảng cách giữa các cột
//         mainAxisSpacing: 4.0, // Khoảng cách giữa các hàng
//       ),
//       //? shrinkWrap
//       // là biến dùng để điều khiển chiều main của GridView
//       //?   true: kích thước main của GridView được tự set sao cho chứa vừa đủ toàn bộ được item, ko lấy dư
//       //?   false: kích thước main của Gridview không được tự set, mà phải dựa vào Parent
//       shrinkWrap: false,
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         Container(color: Colors.red, height: 100),
//         Container(color: Colors.green, height: 100),
//         Container(color: Colors.black, height: 100),
//         Container(color: Colors.yellow, height: 100),
//         Container(color: Colors.purple, height: 100),
//       ],
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('GridView Example')),
//         body: Stack(
//           children: [
//             Container(
//               color: Colors.white,
//             ),
//             Container(
//                 color: Colors.lightBlueAccent, child: const BasicGridView()),
//           ],
//         ),
//       ),
//     );
//   }
// }

//! Ví Dụ 2: Lưới Với GridView.builder
//     //! GridView.builder
//     //? là phương thức để tạo một lưới động.
//     //? Nó tạo các phần tử con khi cần thiết,
//     //? giúp tiết kiệm tài nguyên hệ thống cho các lưới có số lượng phần tử lớn hoặc không xác định.
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class DynamicGridView extends StatelessWidget {
//   const DynamicGridView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       // scrollDirection: Axis.horizontal,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, // Số cột
//       ),
//       itemCount: 30,
//       itemBuilder: (context, index) {
//         return Container(
//           color: Colors.primaries[index % Colors.primaries.length],
//           height: 100,
//         );
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
//         appBar: AppBar(title: const Text('GridView.builder Example')),
//         body: const DynamicGridView(),
//       ),
//     );
//   }
// }

//! Ví Dụ 3: Lưới Với Kích Thước Động
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class DynamicSizedGridView extends StatelessWidget {
  const DynamicSizedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //? gridDelegate
      // Xác định cách các phần tử trong lưới sẽ được sắp xếp và bố trí.
      // Có nhiều loại gridDelegate, bao gồm:

      //?   SliverGridDelegateWithMaxCrossAxisExtent
      //    Đặt chiều rộng tối đa cho các phần tử trong lưới.
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500, // Kích thước tối đa của mỗi phần tử
        //? childAspectRatio
        mainAxisExtent: 100,
        //  Tỷ lệ chiều rộng/chiều cao của mỗi phần tử trong lưới.
        // childAspectRatio: 4 / 3,
      ),

      //?   SliverGridDelegateWithFixedCrossAxisCount
      //    Đặt số cột cố định trong lưới.
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,  // 3 cột
      //   crossAxisSpacing: 4.0,  // Khoảng cách giữa các cột
      //   mainAxisSpacing: 4.0,   // Khoảng cách giữa các hàng
      // ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
          height: 100,
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: const Text('GridView.maxCrossAxisExtent Example')),
        body: const DynamicSizedGridView(),
      ),
    );
  }
}
