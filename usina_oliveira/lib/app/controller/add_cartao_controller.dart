import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/model/cartao_model.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';

class AddCartaoController extends GetxController {
  final UserRepository repository;
  AddCartaoController({@required this.repository}) : assert(repository != null);

  final _showBack = false.obs;
  get showBack => this._showBack.value;
  set showBack(value) => this._showBack.value = value;

  final cartao = CartaoModel();
  
  showBackCodigo() => this.showBack == false ? this.showBack = true : this.showBack = false;

  onChangeNome(value) => this.cartao.nome = value;
  onSavedName(value) => this.cartao.nome = value;
  nameValidate(value) => value < 3 ? 'Insira um nome válido' : null;

  onSavedNumero(value) => this.cartao.numero = value;
  onChangeNumero(value) => value != this.cartao.numero ? this.cartao.numero = value : null;
  validateNumero(value) => value.length == 16 ? null :'Insira um cartão válido' ;

  onSavedValidade(value) => value < 3 ? 'Insira um código de cartão válido' : this.cartao.validade = value;
  onChangeValidade(value) => this.cartao.validade = value;
  validateValidade(value) => value.length < 5 ? 'Insira uma validade válida' : null;

  validateCodigo(value) => value < 3 ? 'Insirá um código válido' : null ;
  onSavedCodigo(value) => value < 3 ? null : this.cartao.codigo = value;
  onChangeCodigo(value) {this.cartao.codigo = value; print(this.cartao.codigo);}

}