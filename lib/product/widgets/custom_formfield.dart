import 'package:flutter/material.dart';
import 'package:hm_onboard/product/components/app_color.dart';
import 'package:hm_onboard/product/components/app_string.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.inputType,
      required this.name,
      this.suffixIcon,
      this.visible,
      required this.focusnode})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType inputType;
  final String name;
  final IconButton? suffixIcon;
  final bool? visible;
  final FocusNode focusnode;

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.alertEmpty;
        }
        if (value.length < 6) {
          return AppString.alertSize;
        }
      },
      focusNode: widget.focusnode,
      controller: widget.controller,
      obscureText: widget.visible ?? true,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        labelText: widget.name,
        labelStyle: const TextStyle(color: AppColor.loginFormField),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide:
                BorderSide(color: AppColor.loginFormField.withOpacity(0.7))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: AppColor.loginFormField.withOpacity(0.7),
            )),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
