import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';

class PesquisarController extends GetxController {
  final EmpresaRepository repository;
  PesquisarController({@required this.repository}) : assert(repository != null);

  final _selectedItem = 0.obs;
  get selectedItem => this._selectedItem.value;
  set selectedItem(value) => this._selectedItem.value = value;

  final _filtros = ['Avaliação', 'Cidade', 'Estado', 'Certificados'].obs;
  get filtros => this._filtros.value;
  set filtros(value) => this._filtros.value = value;

  final _distancia = 1.0.obs;
  get distancia => this._distancia.value;
  set distancia(value) => this._distancia.value = value;

  final _categorias = ['Usina', 'Mecânica', 'Limpeza', 'Construção Civil'].obs;
  get categorias => this._categorias.value;
  set categorias(value) => this._categorias.value = value;

  changeDistancia(value){ this.distancia = value; print(this.distancia);}

  void selectItem(index) {
    print(index);
    this.selectedItem = index;
  }
}
