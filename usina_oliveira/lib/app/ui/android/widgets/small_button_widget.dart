import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_controller.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class CustomSmallButtonWidget extends Container {
  final String text;
  final int index;

  CustomSmallButtonWidget(
      {this.text, this.index,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<PesquisarController>(builder: (_) {
        return RaisedButton(
          color: _.selectedItem == index ? Colors.green : Colors.grey,
          onPressed: ()=> _.selectItem(this.index),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text(
            this.text,
            style: whiteColor,
          ),
        );
      }),
    );
  }
}
