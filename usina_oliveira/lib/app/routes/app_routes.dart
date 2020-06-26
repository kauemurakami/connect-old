import 'package:get/get.dart';
import 'package:usina_oliveira/app/ui/android/adicionar_cartao/adicionar_cartao_page.dart';
import 'package:usina_oliveira/app/ui/android/agendar_contratacao/agendar_contratacao_page.dart';
import 'package:usina_oliveira/app/ui/android/avaliacao_servico/avaliacao_servico_page.dart';
import 'package:usina_oliveira/app/ui/android/cadastro_page/cadastro_page.dart';
import 'package:usina_oliveira/app/ui/android/confirmacao_pagamento/confirmacao_pagamento.dart';
import 'package:usina_oliveira/app/ui/android/empresa/agendar_contratacao/agendar_contratacao_page.dart';
import 'package:usina_oliveira/app/ui/android/empresa/editar_perfil/editar_perfil_empresa_page.dart';
import 'package:usina_oliveira/app/ui/android/empresa/empresa_home/empresa_home_page.dart';
import 'package:usina_oliveira/app/ui/android/empresa/perfil_empresa/perfil_empresa_page.dart';
import 'package:usina_oliveira/app/ui/android/empresa/pesquisar_prestador/pesquisar_prestador_page.dart';
import 'package:usina_oliveira/app/ui/android/empresa/servicos_contratados_prestados/servicos_contratados_prestados_page.dart';
import 'package:usina_oliveira/app/ui/android/empresa_home/empresa_home_page.dart';
import 'package:usina_oliveira/app/ui/android/filtros/filtros_page.dart';
import 'package:usina_oliveira/app/ui/android/login/login_page.dart';
import 'package:usina_oliveira/app/ui/android/notificacoes/notificacoes_page.dart';
import 'package:usina_oliveira/app/ui/android/pagamento/pagamento_page.dart';
import 'package:usina_oliveira/app/ui/android/prestador/editar_perfil_prestador/editar_perfil_prestador_page.dart';
import 'package:usina_oliveira/app/ui/android/prestador/prestador_home/prestador_home_page.dart';
import 'package:usina_oliveira/app/ui/android/servicos_cadastrados/servicos_cadastrados_page.dart';
import 'package:usina_oliveira/app/ui/android/splash/splash_page.dart';
import 'package:usina_oliveira/app/ui/android/validar_certificacoes/validar_certificacoes.dart';

class MyRoutes {

  static final routes = [
    GetPage(name: '/', page:()=> SplashPage(),),
    GetPage(name: '/login', page:()=> LoginPage()),
    GetPage(name: '/prestador-home', page:()=> PrestadorHomePage()),
    GetPage(name: '/empresa-home', page:()=> EmpresaHomePage()),
    GetPage(name: '/cadastro', page:()=> CadastroPage()),
    GetPage(name: '/adicionar-cartao', page:()=> AdicionarCartaoPage()),
    GetPage(name: '/confirmacao-pagamento', page:()=> ConfirmacaoPagamentoPage()),
    GetPage(name: '/servicos-cadastrados', page:()=> ServicosCadastradosPage()),
    GetPage(name: '/pagamento', page:()=> PagamentoPage()),
    GetPage(name: '/validar-certificacoes', page:()=> ValidarCertificacoesPage()),
    GetPage(name: '/notificacoes', page:()=> NotificacoesPage()),
    GetPage(name: '/servicos-prestados-ou-contratados', page:()=> ServicosPrestadosEContratadosPage()),
    GetPage(name: '/avaliacao-servico', page:()=> AvaliacaoServicoPage()),
    GetPage(name: '/agendar-contratacao', page:()=> AgendarContratacaoPage()),
    GetPage(name: '/pesquisar-prestador', page:()=> PesquisarPrestadorPage()),
    GetPage(name: '/filtros', page:()=> FiltrosPage()),
    GetPage(name: '/perfil-empresa', page:()=> PerfilEmpresaPage()),
    GetPage(name: '/editar-perfil-empresa', page:()=> EditarPerfilEmpresaPage()),
    GetPage(name: '/editar-perfil-prestador', page:()=> EditarPerfilPrestadorPage()),
  ];
}