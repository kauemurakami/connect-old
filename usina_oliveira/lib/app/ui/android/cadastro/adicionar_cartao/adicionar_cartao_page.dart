import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/add_cartao_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/user_repository.dart';
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
                  width: MediaQuery.of(context).size.width,
                  child: GetX<AddCartaoController>(
                      init: AddCartaoController(repository: this.repository),
                      builder: (_) {
                        print(_.cartao.numero);
                        return Container(
                            child: CreditCardWidget(
                                cardNumber: _.cartao.numero,
                                expiryDate: _.cartao.validade,
                                cardHolderName: _.cartao.nome,
                                cvvCode: _.cartao.codigo,
                                showBackView: _.showBack));
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
