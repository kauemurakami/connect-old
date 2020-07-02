import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/model/prestador_model.dart';
import 'package:usina_oliveira/app/data/repository/prestador_repository.dart';

class PesquisarPrestadoresController extends GetxController {

  final PrestadorRepository repository;
  
  PesquisarPrestadoresController({@required this.repository}) : assert(repository != null);
  
  //prestadores list
  final _prestadores = [PrestadorModel(nome: 'Kaue'),PrestadorModel(nome: 'João'), PrestadorModel(nome: 'Carlos') ].obs;
  get prestadores => this._prestadores.value;
  set prestadores(value) => this._prestadores.value = value;


  
}