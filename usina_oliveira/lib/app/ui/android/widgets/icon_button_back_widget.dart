import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconButtonBackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back());
  }
}
