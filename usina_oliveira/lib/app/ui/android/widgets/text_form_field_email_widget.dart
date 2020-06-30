import 'package:flutter/material.dart';

class CustomTextFormFieldEmail extends StatelessWidget {

  final Function(String value) onSaved;
  final Function(String value) onChanged;
  final Function(String value) validator;
  final bool emailCheck;
  final String text;
  
  CustomTextFormFieldEmail({this.emailCheck, this.text, this.onChanged, this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.green,
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.only(top: 5),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          labelText: this.text,
          suffixIcon: Icon(
            Icons.check_circle,
            color: this.emailCheck ? Colors.green : Colors.grey,
          )),
      onChanged: (value) => this.onChanged(value),
      onSaved: (value) => this.onSaved(value),
      validator: (value) => this.validator(value),
      textInputAction: TextInputAction.next,
    );
  }
}
