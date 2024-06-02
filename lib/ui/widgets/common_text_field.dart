import 'package:flutter/material.dart';
import 'package:product_show_case/ui/theme/text_style.dart';

import 'package:product_show_case/ui/widgets/common_image_view.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String icon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  bool isObscureText;

  CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.validator,
    this.textInputType,
    this.currentFocusNode,
    this.nextFocusNode,
    this.isObscureText = false,
  });
  final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isObscureText) {
      _obscureTextNotifier.value = isObscureText;
    }

    return Column(
      children: [
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 23),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: _obscureTextNotifier,
              builder: (BuildContext context, bool isRemmebered, Widget? child) {
                return TextFormField(
                  focusNode: currentFocusNode,
                  autofocus: true,
                  obscureText: isObscureText ? _obscureTextNotifier.value : false,
                  onEditingComplete:
                      nextFocusNode != null ? () => FocusScope.of(context).requestFocus(nextFocusNode) : null,
                  decoration: InputDecoration(
                    icon: Container(
                      height: 25,
                      margin: const EdgeInsets.only(left: 15),
                      child: CommonImageView(svgPath: icon, fit: BoxFit.contain),
                    ),
                    suffixIcon: isObscureText
                        ? IconButton(
                            onPressed: () {
                              _obscureTextNotifier.value = !_obscureTextNotifier.value;
                            },
                            icon: _obscureTextNotifier.value
                                ? Icon(Icons.visibility_off, color: theme.hintColor)
                                : Icon(Icons.visibility, color: theme.hintColor),
                          )
                        : null,
                    hintText: hintText,
                    hintStyle: TextStyle(color: theme.hintColor),
                    border: InputBorder.none,
                  ),
                  validator: validator,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
