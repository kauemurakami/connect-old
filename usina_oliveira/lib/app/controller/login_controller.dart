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
  
}