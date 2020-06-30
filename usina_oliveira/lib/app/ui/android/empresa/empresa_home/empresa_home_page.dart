import 'package:flutter/material.dart';

class EmpresaHomePage extends StatelessWidget {
//repository injection
//final MyRepository repository = MyRepository(apiClient: MyApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      body: Container(),// prestadores mais proximos
    );
  }
}
