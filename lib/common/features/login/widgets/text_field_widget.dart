import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String)? onSubmitted;
  final int? maxLines;
  final Widget icon;
  final bool isPassword;

  const TextFieldWidget({
    super.key,
    this.controller,
    this.textInputType = TextInputType.text,
    this.onSubmitted,
    this.maxLines,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        keyboardType: textInputType,
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: false,
        ),
      ),
    );
  }
}
