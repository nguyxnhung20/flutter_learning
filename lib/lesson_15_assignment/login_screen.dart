import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  //! Bước 1: Tạo GlobalKey<FormState>
  //? Sử dụng GlobalKey<FormState> để quản lý trạng thái của form
  //? và thực hiện các hành động như validation.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        //! Bước 2: Xử Lý Xác Thực
        //? Sử dụng Form widget để bao bọc các TextFormField,
        //? và gọi phương thức validate() khi cần kiểm tra tính hợp lệ của form.
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo or Icon
              const Icon(
                Icons.donut_large, // Đại diện cho Logo App
                size: 100,
                color: Colors.black,
              ),
              const SizedBox(height: 20),

              // Title Text
              const Text(
                'Welcome to Flutter Course!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Subtitle Text
              const Text(
                'Unleash your power',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),

              // Email TextField
              TextFormField(
                validator: (valueInEmailTextfield) {
                  if (valueInEmailTextfield == null ||
                      valueInEmailTextfield.length < 10) {
                    return 'Email phải có hơn 10 kí tự';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              //! Bước 3: Tạo TextFormField với Hàm Validation
              //? Sử dụng thuộc tính validator của TextFormField để định nghĩa các điều kiện validation.
              // Password TextField with toggle obscure text
              TextFormField(
                validator: (valueInPasswordTextfield) {
                  if (valueInPasswordTextfield == null ||
                      valueInPasswordTextfield.length < 10) {
                    return 'Password phải hơn 10 kí tự';
                  }
                  return null;
                },
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your paster',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Thông tin hợp lệ, có thể đăng nhập")));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('LOGIN'),
                ),
              ),
              const SizedBox(height: 10),

              // Forgot Password Text
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              const SizedBox(height: 30),

              // Register Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Register!',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
