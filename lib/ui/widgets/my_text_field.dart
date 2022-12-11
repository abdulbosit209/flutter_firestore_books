import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
    this.inputFormatters,
    this.isDone = false,
    required this.obscureText,
  }) : super(key: key);

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final String text;
  final ValueChanged? onChanged;
  final bool obscureText;
  bool? isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), offset: const Offset(1,3), blurRadius: 4, spreadRadius: 2,)]
      ),
      child: TextFormField(
        textInputAction: isDone! ? TextInputAction.done : TextInputAction.next,
        onChanged: onChanged,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black),
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(

          hintText: text,
          contentPadding: const EdgeInsets.only(left: 20),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder:  const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        cursorColor: Colors.blue,
      ),
    );
  }
}