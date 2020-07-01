import 'package:get/get.dart';

class RxEmpresaModel {
  final nome = ''.obs;
  final id = 0.obs;
}

class EmpresaModel {
  EmpresaModel({id, name});

  final rx = RxEmpresaModel();

  get nome => rx.nome.value;
  set nome(value) => rx.nome.value = value;

  get id => rx.id.value;
  set id(value) => rx.id.value = value;
  
  EmpresaModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['id'] = this.id;
    return data;
  }
}
