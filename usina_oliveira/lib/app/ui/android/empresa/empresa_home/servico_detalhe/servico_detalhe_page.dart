import 'package:flutter/material.dart';

class ServicoDetalhePage extends StatelessWidget {

//repository injection
//final Repository repository = Repository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    body: Container(
        child: Text('detalhes do servico'),
      ),
    );
  }
}