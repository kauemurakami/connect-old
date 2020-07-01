import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/add_cartao_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';
import 'package:usina_oliveira/app/ui/android/cadastro/adicionar_cartao/widgets/cartao_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/button_custom_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_back_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/text_form_field_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';
import 'package:http/http.dart' as http;
import 'package:credit_card_detector/credit_card_detector.dart';

class AdicionarCartaoPage extends StatelessWidget {
//repository injection
  final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButtonBackWidget(),
                  Text(
                    'Adicionar cartão',
                    style: titulo,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: GetX<AddCartaoController>(
                    init: AddCartaoController(repository: this.repository),
                    builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).orientation == Orientation.landscape  ? 400 : MediaQuery.of(context).size.width / 1.0 ,
                            child: CustomCartaoWidget(
                            codigo: _.cartao.codigo,
                            nome: _.cartao.nome,
                            numero: _.cartao.numero,
                            showBack: _.showBack,
                            validade: _.cartao.validade,
                          )),
                        ],
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GetX<AddCartaoController>(builder: (_) {
                        return Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomTextFormField(
                                  type: TextInputType.text,
                                  direction: TextDirection.rtl,
                                  onChanged: (value) => _.onChangeNome(value),
                                  onSaved: (value) => _.onSavedName(value),
                                  validator: (value) => _.nameValidate(value),
                                  action: TextInputAction.next,
                                  text: 'Nome',
                                ),
                                CustomTextFormField(
                                  max: 16,
                                  type: TextInputType.number,
                                  direction: TextDirection.rtl,
                                  onChanged: (value) => _.onChangeNumero(value),
                                  onSaved: (value) => _.onSavedNumero(value),
                                  validator: (value) => _.validateNumero(value),
                                  action: TextInputAction.next,
                                  text: 'Número do cartão',
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: CustomTextFormField(
                                        max: 5,
                                        type: TextInputType.datetime,
                                        direction: TextDirection.rtl,
                                        onChanged: (value) =>
                                            _.onChangeValidade(value),
                                        onSaved: (value) =>
                                            _.onSavedValidade(value),
                                        validator: (value) =>
                                            _.validateValidade(value),
                                        action: TextInputAction.next,
                                        text: 'Validade',
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: FocusScope(
                                        child: Focus(
                                          onFocusChange: (value) =>
                                              _.showBackCodigo(),
                                          child: CustomTextFormField(
                                            type: TextInputType.number,
                                            direction: TextDirection.rtl,
                                            onChanged: (value) =>
                                                _.onChangeCodigo(value),
                                            onSaved: (value) =>
                                                _.onSavedCodigo(value),
                                            validator: (value) =>
                                                _.validateCodigo(value),
                                            action: TextInputAction.next,
                                            text: 'Código',
                                            max: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 48,
                                ),
                                CustomButtonWidget(
                                    text: 'Cadastrar',
                                    callback: () {
                                      Get.offNamed('confirmacao-pagamento');
                                      final FormState form =
                                          _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        //_.cadastrar();
                                        //Get.toNamed('confirmacao-pagamento');
                                      } else {
                                        //snackbar
                                        print('erro ao entrar');
                                      }
                                    }),
                              ],
                            ),
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

class AdicionarCartaoController {}
