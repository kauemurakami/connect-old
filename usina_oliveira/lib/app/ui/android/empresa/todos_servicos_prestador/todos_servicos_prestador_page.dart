import 'package:flutter/material.dart';

class TodosServicosPrestadorPage extends StatelessWidget {

//repository injection
//final MyRepository repository = MyRepository(apiClient: MyApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Container(
      child: Text('todos os servicos prestador'),
      ),
    );
  }
}