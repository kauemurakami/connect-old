import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_prestadores_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/prestador_repository.dart';
import 'package:usina_oliveira/app/ui/android/widgets/small_button_widget.dart';
import 'package:http/http.dart' as http;

class CustomListservicosWidget extends StatelessWidget {
  final PrestadorRepository repository =
      PrestadorRepository(apiClient: ApiClient(httpClient: http.Client()));
  final PesquisarPrestadoresController controller =
      Get.find<PesquisarPrestadoresController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Container(
            height: 240,
            width: MediaQuery.of(context).size.width / 1.13,
            padding: EdgeInsets.only(left: 8.0),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return Container(
                    width: 180,
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Flexible(
                          child: Card(
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Image.network(
                                      'https://source.unsplash.com/random/150x150',
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 74,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                           Text(
                                            controller.servicos[idx].nome,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 10),
                                          CustomSmallButtonWidget(
                                              callback: controller.detalhesServico,
                                              text: 'Ver +'),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.servicos.length),
          )),
    );
  }
}
