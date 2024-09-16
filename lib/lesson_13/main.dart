import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//!  Widget là gì?
// Widget là thành phần chính trong Flutter dùng để xây dựng giao diện.
// Mọi thứ hiển thị trên màn hình (như nút, văn bản, hình ảnh) đều là Widget.

//! Có 2 loại widget: Stateless Widget, Stateful Widget
//? Stateless Widget: Không thay đổi trạng thái sau khi được vẽ.

//? Stateful Widget: Có thể thay đổi trạng thái và tự động cập nhật giao diện khi trạng thái thay đổi.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //? MyHomePage là stateful widget, bởi vì nó có 1 State object
  //? State object chứa các thuộc tính có thể thay đổi (vd: _counter)
  //? Sự thay đổi giá trị của các thuộc tính sẽ làm thay đổi giao diện

  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //? hàm build() sẽ re-call mỗi lần setState() dc gọi,
  // vd setState() dc gọi để cập nhật giá trị _counter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Flutter Demo Page 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Huy has pushed the button this many times: ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // _counter++;
  }
}
