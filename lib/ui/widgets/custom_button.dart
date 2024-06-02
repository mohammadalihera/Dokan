import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          backgroundColor: theme.primaryColor, // Set custom button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set border radius
          ),
        ),
        onPressed: onTap,
        child: Text(buttonName),
      ),
    );
  }
}
