import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_prestadores_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:usina_oliveira/app/data/repository/prestador_repository.dart';
import 'package:usina_oliveira/app/ui/android/empresa/pesquisar_prestador/widgets/lista_servicos_prestador_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_back_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/small_button_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class PesquisarPrestadoresPage extends StatelessWidget {
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
                  _.servicos;
                  return Column(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height / 1.13,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child:  Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0),
                                            child: Image.network(
                                              'https://source.unsplash.com/random/800x600',
                                              width: 320,
                                              height: 250,
                                            ),
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
                                                          color:
                                                              Colors.lightGreen)),
                                                  child: Padding(
                                                      padding: EdgeInsets.all(4),
                                                      child: Text(
                                                        'Categoria',
                                                        style: destaqueText,
                                                      )),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 16),
                                                    child: Text(
                                                      'Cidade',
                                                      style: destaqueText,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  50,
                                              padding: EdgeInsets.only(
                                                  left: 16, right: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    _.prestadores[index].nome,
                                                    style: subtitulo,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 16.0),
                                                    child: Text(
                                                      'Descrição',
                                                      style: subtitulo,
                                                    ),
                                                  ),
                                                  Container(
                                                      height: 80,
                                                      child: Text(
                                                        'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer to',
                                                        style: descricao,
                                                      ))
                                                ],
                                              )),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.all(4),
                                                      child: Text(
                                                        'Serviços Prestados',
                                                        style: subtitulo,
                                                      )),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.only(left: 16),
                                                      child: GestureDetector(
                                                        onTap: _.verTodos,
                                                        child: Text(
                                                          'VER TODOS',
                                                          style: destaqueText,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          CustomListservicosWidget()
                                        ],
                                      ),
                                    ),
                                  );
                            },
                            itemCount: _.prestadores.length,
                          )),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
