import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:usina_oliveira/app/controller/cadastro_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';
import 'package:usina_oliveira/app/ui/android/widgets/button_custom_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_back_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/text_form_field_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class CadastroPage extends StatelessWidget {
//repository injection
  final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  static final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButtonBackWidget(),
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                          'Cadastre-se abaixo prestador e/ou empresa',
                          style: descricao,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 10),
                      GetX<CadastroController>(
                          init: CadastroController(repository: this.repository),
                          builder: (_) {
                            return Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomTextFormField(
                                    onSaved: (value) => _.onSavedName(value),
                                    validator: (value) => _.nameValidate(value),
                                    action: TextInputAction.next,
                                    text: 'Nome',
                                  ),
                                  CustomTextFormField(
                                    onChanged: (value) => _.onChangeEmail(value),
                                    onSaved: (value) => _.onSavedEmail(value),
                                    validator: (value) => _.emailValidate(value),
                                    action: TextInputAction.next,
                                    text: 'Email de usuário',
                                    sufixIcon: Icon(
                                      Icons.check_circle,
                                      color: _.isEmailCheck
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    controller: _pass,
                                    obscure: _.obscure,
                                    type: TextInputType.emailAddress,
                                    text: 'Senha',
                                    onSaved: (value) => _.onSavedPassword(value),
                                    validator: (value) => _.passwordValidate(value),
                                    action: TextInputAction.next,
                                    sufixIcon: GestureDetector(
                                      onLongPress: () => _.showPassword(),
                                      onLongPressEnd: (details) => _.showPassword(),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                  ),
                                  CustomTextFormField(
                                    controller: _confirmPass,
                                    obscure: _.obscure,
                                    type: TextInputType.text,
                                    text: 'Confirmar senha',
                                    onSaved: (value) => _.onSavedPassword(value),
                                    validator: (value) => _.passwordValidate(value),
                                    action: TextInputAction.next,
                                    sufixIcon: GestureDetector(
                                      onLongPress: () => _.showPassword(),
                                      onLongPressEnd: (details) => _.showPassword(),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48,
                                  ),
                                  CustomButtonWidget(
                                      text: 'Cadastrar',
                                      callback: () {
                                        final FormState form =
                                            _formKey.currentState;
                                        if (form.validate()) {
                                          form.save();
                                          //_.cadastrar
                                          //Get.offAllNamed('/');
                                        } else {
                                          //snackbar
                                          Get.toNamed('add-cartao');
                                          print('erro ao entrar');
                                        }
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Text(
                                          'Já tem uma conta?',
                                          style: TextStyle(color: Colors.greenAccent),
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
            ],
          ),
        ),
      ),
    );
  }
}
