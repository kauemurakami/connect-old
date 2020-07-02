import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';

class PesquisarController extends GetxController {
  final EmpresaRepository repository;
  PesquisarController({@required this.repository}) : assert(repository != null);

  final _selectedItem = 0.obs;
  get selectedItem => this._selectedItem.value;
  set selectedItem(value) => this._selectedItem.value = value;

  final _selectedCategoria = 0.obs;
  get selectedCategoria => this._selectedCategoria.value;
  set selectedCategoria(value) => this._selectedCategoria.value = value;

  final _filtros = ['Avaliação', 'Cidade', 'Estado', 'Certificados'].obs;
  get filtros => this._filtros.value;
  set filtros(value) => this._filtros.value = value;

  final _distancia = 1.0.obs;
  get distancia => this._distancia.value;
  set distancia(value) => this._distancia.value = value;

  final _categorias = ['Usina', 'Mecânica', 'Limpeza', 'Construção Civil'].obs;
  get categorias => this._categorias.value;
  set categorias(value) => this._categorias.value = value;

  changeDistancia(value) => this.distancia = value;

  void selectItem(index) =>
      this._selectedItem != index ? selectedItem = index : null;
  void selectCategoria(index) =>
      this._selectedCategoria != index ? selectedCategoria = index : null;

  pesquisar() {
    Get.toNamed('pesquisar-prestadores');
  }
}
