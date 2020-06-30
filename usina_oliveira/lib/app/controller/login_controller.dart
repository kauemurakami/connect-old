import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/model/user.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';

class LoginController extends GetxController {
  final UserRepository repository;
  LoginController({@required this.repository}) : assert(repository != null);

  final _isEmail = false.obs;
  get isEmail => this._isEmail.value;
  set isEmail(value) => this._isEmail.value = value;

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  final _obscure = true.obs;
  get obscure => this._obscure.value;
  set obscure(value) => this._obscure.value = value;

  //verificar se é usuário comum ou admin
  login() {}
  
  //onChanged
  onChangeEmail(value) {
    if (isEmail(value)) {
      this.isEmail = true;
    } else
      this.isEmail = false;
  }

  //onSaved
  onSavedEmail(value) {
    this.user.email = value;
  }

  onSavedPassword(value) {
    this.user.senha = value;
  }

  emailValidate(value) {
    if (isEmail(value)) {
      return null;
    } else
      return 'Insira um email válido';
  }

  passwordValidate(value) {
    if (isEmail(value)) {
      return null;
    } else
      return 'Insira uma senha válida';
  }

  showPassword() {
    print('show pass');
    if (this.obscure) {
      this.obscure = false;
    } else
      this.obscure = true;
  }
}
