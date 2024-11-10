import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String data;
  final void Function()? onPress;
  const CustomElevatedButton({super.key, required this.data, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: onPress,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.thePrimary),
        ),
        child: Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
