import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_prestadores_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';
import 'package:http/http.dart' as http;
import 'package:usina_oliveira/app/data/repository/prestador_repository.dart';
import 'package:usina_oliveira/app/ui/android/widgets/icon_button_back_widget.dart';

class PrestadoresPesquisaPage extends StatelessWidget {
//repository injection
  final PrestadorRepository prestadorRepository =
      PrestadorRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButtonBackWidget(),
            Expanded(
              child: GetX<PesquisarPrestadoresController>(
                  init: PesquisarPrestadoresController(
                      repository: this.prestadorRepository),
                  builder: (_) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(''))
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
