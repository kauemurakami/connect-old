import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String value) onSaved;
  final Function(String value) onChanged;
  final Function(String value) validator;
  final bool emailCheck;
  final String text;
  final Widget sufixIcon;
  final TextInputAction action;
  final TextInputType type;
  final bool obscure;

  CustomTextFormField(
      {this.emailCheck,
      this.text,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.sufixIcon,
      this.action,
      this.type,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.obscure,
      style: TextStyle(fontSize: 18),
      keyboardType: this.type,
      cursorColor: Colors.green,
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.only(top: 5),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          labelText: this.text,
          suffixIcon: this.sufixIcon),
      onChanged: (value) => this.onChanged(value),
      onSaved: (value) => this.onSaved(value),
      validator: (value) => this.validator(value),
      textInputAction: this.action,
    );
  }
}
