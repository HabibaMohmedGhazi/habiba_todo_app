import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/utilities/common/app_colors.dart';

class CustomAuthTextFormField extends StatefulWidget {
  final String theHintText;
  Widget? prefixIcon;
  String? Function(String?)? validator;

  TextEditingController? theController;
  TextInputType? keyboardType;
  CustomAuthTextFormField(
      {super.key,
      required this.theHintText,
      this.prefixIcon,
      this.theController,
      this.keyboardType,
      this.validator});

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.theController,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            hintText: widget.theHintText,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none),
            fillColor: Colors.white30,
            filled: true,
            hintStyle: const TextStyle(
              color: AppColors.thePrimary,
            ),
            prefixIcon: widget.prefixIcon),
      ),
    );
  }
}
