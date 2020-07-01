import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/ui/android/widgets/button_custom_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_close_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class ConfirmacaoPagamentoPage extends StatelessWidget {
//repository injection
//final MyRepository repository = MyRepository(apiClient: MyApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButtonCloseWidget(
                  callback: () {
                    //Get.toNamed('prestador-home');
                    Get.toNamed('empresa-home');
                    /*if(user == empresa){
                Get.toNamed('empresahome');
              }else{ Get.toNamed('prestador-home');*/
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Text(
              'Pagamento \nConfirmado',
              style: titulo,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text(
              'Veja os detalhes abaixo',
              style: descricao,
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                        child: Text(
                          'Id Ordem',
                          style: descricao,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                        child: Text(
                          '#9876543290',
                          style: destaqueText,
                        ),
                      ), //ordem pagamento
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                        child: Text('Data', style: descricao),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                        child: Text(
                          '11 Maio 09:10 am 2020',
                          style: destaqueText,
                        ),
                      ), //data pagamento
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Container(
              width: 300,
              child: CustomButtonWidget(
                text: 'Início',
                callback: () => Get.toNamed('prestador-home'),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    ));
  }
}
