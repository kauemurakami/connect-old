import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/empresa_home_controller.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';
import 'package:usina_oliveira/app/data/repository/empresa_repository.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/telas/cadastro_servico_screen.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/telas/home_screen.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/telas/perfil_screen.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/telas/pesquisar_screen.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/telas/relatios_screen.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/widgets/bottom_navigation_widget.dart';
import 'package:http/http.dart' as http;

class EmpresaHomePage extends StatelessWidget {
//repository injection
  final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));

  final List<Widget> telas = [
    HomeScreen(),
    PesquisarScreen(),
    EmpresaRelatoriosScreen(),
    CadastroServicoScreen(),
    EmpresaPerfilScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<EmpresaHomeController>(
          init: EmpresaHomeController(repository: this.repository),
          builder: (_) {
            print(_.screen);
            return telas[_.screen];
          },
        ),
      ), // prestadores mais proximos

      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
