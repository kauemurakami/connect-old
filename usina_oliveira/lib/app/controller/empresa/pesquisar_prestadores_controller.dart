import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/model/prestador_model.dart';
import 'package:usina_oliveira/app/data/model/servico_model.dart';
import 'package:usina_oliveira/app/data/repository/prestador_repository.dart';

class PesquisarPrestadoresController extends GetxController {

  final PrestadorRepository repository;

  PesquisarPrestadoresController({@required this.repository}) : assert(repository != null);

  final _servicos = [ServicoModel(nome:'Limpeza geral'), ServicoModel(nome:'Limpeza de ar condicionado'), ServicoModel(nome:'Limpeza')].obs;
  get servicos => this._servicos.value;
  set servicos(value) => this._servicos.value = value;
 

  //prestadores list  
  final _prestadores = [PrestadorModel(nome: 'Kaue'), PrestadorModel(nome: 'João'), PrestadorModel(nome: 'Carlos')].obs;
  get prestadores => this._prestadores.value;
  set prestadores(value) => this._prestadores.value = value;
  
  
  detalhesServico(){
    Get.toNamed('detalhes-servico');
  }
  verTodos(){
    Get.toNamed('todos-servicos-prestador');
  }
  
}