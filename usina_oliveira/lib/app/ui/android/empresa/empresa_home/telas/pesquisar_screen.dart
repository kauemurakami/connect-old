import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';
import 'package:http/http.dart' as http;
import 'package:usina_oliveira/app/ui/android/widgets/appbar_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/button_custom_widget.dart';
import 'package:usina_oliveira/app/ui/android/widgets/small_button_widget.dart';
import 'package:usina_oliveira/app/ui/theme/app_text_theme.dart';

class PesquisarScreen extends StatelessWidget {
//repository injection
  final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: CustomAppBar(
        bgColor: Colors.white,
        color: Colors.black,
        text: 'Pesquisar',
        iconsColor: Colors.black,
        icons: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: null),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Filtrar',
                style: subtitulo,
              )),
          GetX<PesquisarController>(
            init: PesquisarController(repository: this.repository),
            builder: (_) {
              return Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx( ()=> CustomSmallButtonWidget(
                          text: _.filtros[index],
                          index: index,
                          item: _.selectedItem,
                          callback: () => _.selectItem(index),
                        )),
                      );
                    },
                    itemCount: _.filtros.length,
                  ));
            },
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: GetX<PesquisarController>(builder: (_) {
              return Row(
                children: <Widget>[
                  Text(
                    'Distância',
                    style: subtitulo,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      _.distancia.toStringAsFixed(0) + 'km',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              );
            }),
          ),
          GetX<PesquisarController>(builder: (_) {
            return Slider(
              min: 0,
              divisions: 8,
              max: 80,
              value: _.distancia,
              label: _.distancia.toStringAsFixed(0) + ' km',
              onChanged: (value) => _.changeDistancia(value),
            );
          }),
          Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Text(
                'Categorias',
                style: subtitulo,
              )),
          GetX<PesquisarController>(builder: (_) {
            //var select = _.selectedCategoria;
            return Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Obx( () => CustomSmallButtonWidget(
                      text: _.categorias[index],
                      index: index,
                      item: _.selectedCategoria,
                      callback: () => _.selectCategoria(index),
                    )),
                  );
                },
                itemCount: _.categorias.length,
              ),
            );
          }),

          //lista de prestadores ????
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: GetX<PesquisarController>(
                  builder: (_) {
                    return CustomButtonWidget(
                        text: 'Pesquisar', callback: _.pesquisar);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
