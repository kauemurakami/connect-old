import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/recuperar_senha_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';
import 'package:usina_oliveira/app/ui/android/widgets/button_custom_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';
import 'package:http/http.dart' as http;

class RecuperarSenhaPage extends StatelessWidget {
  final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  static GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Cadastro',
              style: titulo,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Cadastre-se abaixo prestado e/ou empresa',
                style: descricao,
              ),
            ),
            GetX<RecuperarSenhaController>(
                init: RecuperarSenhaController(repository: this.repository),
                builder: (_) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                              //contentPadding: EdgeInsets.only(top: 5),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Email',
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color:
                                    _.isEmailCheck ? Colors.green : Colors.grey,
                              )),
                          onChanged: (value) => _.onChangeEmail(value),
                          onSaved: (value) => _.onSavedEmail(value),
                          validator: (value) => _.emailValidate(value),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 24.0, bottom: 24.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => Get.toNamed('recuperar-senha'),
                              child: Text(
                                'Esqueceu sua senha?',
                                style: textInfo,
                              ),
                            ),
                          ),
                        ),
                        //CustomButtonWidget(text: 'Entrar', callback: _.login),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () => Get.toNamed('cadastro'),
                              child: Text(
                                'Você não tem cadastro? Clique aqui',
                                style: textInfo,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
