import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/pesquisar_prestadores_controller.dart';
import 'package:usina_oliveira/app/ui/android/widgets/small_button_widget.dart';

class CustomListservicosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PesquisarPrestadoresController>(
      builder: (_) {
        return Container(
          height: 230,
          width: MediaQuery.of(context).size.width / 1.13,
          padding: EdgeInsets.only(left: 8.0),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 180,
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
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_.servicos[index].nome ?? 'aa'),
                                  CustomSmallButtonWidget(
                                      callback: _.detalhesServico,
                                      text: 'Ver +'),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _.servicos.length),
        );
      },
    );
  }
}
