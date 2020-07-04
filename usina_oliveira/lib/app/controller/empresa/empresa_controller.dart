import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';

class EmpresaHomeController extends GetxController {
  final EmpresaRepository repository;
  EmpresaHomeController({@required this.repository})
      : assert(repository != null);

  final _screen = 0.obs;
  get screen => this._screen.value;
  set screen(value) => this._screen.value = value;

  //telefone da empresa
  ligar() async {
    const url = "tel:(16)999999999";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Aplicativo não encontrado';
    }
  }
}
