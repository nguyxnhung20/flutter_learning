import 'package:flutter/material.dart';

class PhoneNumInput extends StatelessWidget {
  final TextEditingController phoneNumController;

  const PhoneNumInput({
    super.key,
    required this.phoneNumController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: TextField(
        controller: phoneNumController,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.flag,
                  color: Colors.white,
                )),
            hintText: "Nhập số điện thoại",
            hintStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
