import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  String label;
  IconData? icon;
  bool isPassword;
  String? Function(String?)? validator;
  TextEditingController controller;
  int? maxLines;
  CustomTextFiled({
    super.key,
     this.icon,
    required this.label,
    this.isPassword = false,
    required this.validator,
    required this.controller,
     this.maxLines=1
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium,
        maxLines: widget.maxLines,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isPassword ? obscure : false,
        decoration: InputDecoration(
          label: Text(widget.label),
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
