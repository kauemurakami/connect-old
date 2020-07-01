import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';

class EmpresaRelatoriosScreen extends StatelessWidget {
//repository injection
  final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('empresa relatorios')),
    );
  }
}
