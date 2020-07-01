import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/controller/empresa/empresa_home_controller.dart';

class CustomBottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetX<EmpresaHomeController>(
      builder: (_) {
        return BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        currentIndex: _.screen,
        onTap: (index) => _.screen = index,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.greenAccent,
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.amber[400],
              title: Text("Pesquisar"),
              icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            //backgroundColor: Colors.lightGreenAccent,
            title: Text("Relatórios"),
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.cyanAccent,
            title: Text("Serviços"),
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.cyanAccent,
            title: Text("Perfil"),
            icon: Icon(Icons.account_circle),
          ),
        ]);
      },
    );
  }
}
