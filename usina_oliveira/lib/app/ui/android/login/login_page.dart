import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/login_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_back_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
//repository injection
  final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    GlobalKey _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButtonBackWidget(),
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Login',
                  style: titulo,
                ),
                Text(
                  'Faça o login abaixo',
                  style: descricao,
                ),
                GetX<LoginController>(
                  init: LoginController(repository: this.repository),
                  builder: (_) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: 'a',
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color: _.isEmail ? Colors.green : Colors.grey,
                              )),
                          onChanged: (value) {
                            if(isEmail(value)){
                              _.isEmail = true;
                            }else _.isEmail = false;
                          },
                          onSaved: (value) {
                            if (isEmail(value)) {
                              
                            } else {}
                          },
                          validator: (value) {
                            return 'a';
                          },
                        ),
                        TextFormField(),
                        Text(
                          'Esqueceu sua senha?',
                          style: textoInfo,
                        ),
                        RaisedButton(onPressed: () {}),
                        Text(
                          'Você não tem cadastro? Clique aqui',
                          style: textoInfo,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
