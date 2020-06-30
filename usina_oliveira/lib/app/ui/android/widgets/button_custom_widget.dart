import 'package:flutter/material.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  CustomButtonWidget({@required this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 0.5,
      height: MediaQuery.of(context).size.height / 16,
      child: RaisedButton(
        autofocus: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
          onPressed: this.callback,
          child: Text(
            this.text,
            style: textButton,
          ),
          color: Colors.green),
    );
  }
}
