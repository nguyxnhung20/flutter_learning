import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const EmailInput({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value != null) {
            if (value.length < 5) {
              return "Email ko hợp lệ, vui lòng thử lại";
            }
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            hintText: "Nhập email",
            hintStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
