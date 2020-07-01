import 'package:flutter/material.dart';

class IconButtonCloseWidget extends StatelessWidget {
  final VoidCallback callback;

  IconButtonCloseWidget({this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          IconButton(icon: Icon(Icons.close), onPressed: () => this.callback),
    );
  }
}
