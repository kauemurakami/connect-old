import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_prestadores_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';
import 'package:http/http.dart' as http;
import 'package:usina_oliveira/app/data/repository/prestador_repository.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_back_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class PrestadoresPesquisaPage extends StatelessWidget {
//repository injection
  final PrestadorRepository prestadorRepository =
      PrestadorRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButtonBackWidget(),
              GetX<PesquisarPrestadoresController>(
                init: PesquisarPrestadoresController(
                    repository: this.prestadorRepository),
                builder: (_) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Obx(() => Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image.network(
                                        'https://source.unsplash.com/random/300x300',
                                        width: 300,
                                        height: 300,
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.lightGreen)),
                                              child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Text(
                                                    'Categoria',
                                                    style: destaqueText,
                                                  )),
                                            ),
                                            Padding(
                                                  padding: EdgeInsets.only(left: 16),
                                                  child: Text(
                                                    'Cidade',
                                                    style: destaqueText,
                                                  )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        },
                        itemCount: _.prestadores.length,
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
