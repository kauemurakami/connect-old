import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';

class PesquisarController extends GetxController {

  final EmpresaRepository repository;
  PesquisarController({@required this.repository}) : assert(repository != null);

  final _selectedItem = 0.obs;
  get selectedItem => this._selectedItem.value;
  set selectedItem(value) => this._selectedItem.value = value;
  
  final _categorias = ['Avaliação','Cidade','Estado','Certificados'].obs;
  get categorias => this._categorias.value;
  set categorias(value) => this._categorias.value = value;

  void selectItem(index){
    print(index);
    this.selectedItem = index;
  }

}