import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;

  const CustomIconButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 56,
      width: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set border radius
          ),
        ),
        onPressed: () {},
        child: child,
      ),
    );
  }
}
