import 'package:get/get.dart';
import 'package:usina_oliveira/app/ui/android/adicionar_cartao/adicionar_cartao_page.dart';
import 'package:usina_oliveira/app/ui/android/cadastro_page/cadastro_page.dart';
import 'package:usina_oliveira/app/ui/android/confirmacao_pagamento/confirmacao_pagamento.dart';
import 'package:usina_oliveira/app/ui/android/empresa_home/empresa_home_page.dart';
import 'package:usina_oliveira/app/ui/android/login/login_page.dart';
import 'package:usina_oliveira/app/ui/android/notificacoes/notificacoes_page.dart';
import 'package:usina_oliveira/app/ui/android/pagamento/pagamento_page.dart';
import 'package:usina_oliveira/app/ui/android/prestador_home/prestador_home_page.dart';
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
    

  ];
}