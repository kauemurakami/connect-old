import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  
  final Color color;
  final String text;
  final List<Widget> icons;
  final Color iconsColor;
  final Color bgColor;

  CustomAppBar(
      {this.color, this.text, this.icons, this.iconsColor, this.bgColor });
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  List<Widget> _criarIcones() {
    List<Widget> list = [];
    for (IconButton widget in icons) {
      list.add(widget);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: this.bgColor,
        title: Text(
          this.text,
          style: TextStyle(color: this.color),
        ), //nome empresa
        actions: this._criarIcones());
  }
}
