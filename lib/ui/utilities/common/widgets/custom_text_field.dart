import 'package:flutter/material.dart';

// it is better to make the custom text field statefulWidget as it rebuilds alot
class CustomTextField extends StatefulWidget {
  final String? hintText;

  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
