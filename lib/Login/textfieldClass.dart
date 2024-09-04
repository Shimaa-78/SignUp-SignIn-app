import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String txt;
  bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  CustomTextField({
    super.key,
    required this.txt,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Adjust border radius
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 240, 232, 232)
                .withOpacity(0.3), // Shadow color
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
        border: Border.all(
            color: Color.fromARGB(255, 247, 240, 240)), // Lighter border color
      ),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obscureText && widget.isPassword,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    _obscureText = !_obscureText;
                    setState(() {});
                  },
                  child: Icon(
                    _obscureText
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    size: 20.0,
                  ),
                )
              : null,
          hintText: widget.txt,
          hintStyle: TextStyle(color: Colors.grey[500], fontFamily: "Poppins"),
          border: InputBorder.none, // Remove border from InputDecoration
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
