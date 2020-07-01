import 'package:get/get.dart';

class RxCartaoModel {

  final numero = ''.obs;
  final banco = 'Banco'.obs;
  final nome = 'MARIA JOSE DA SILVA'.obs;
  final validade = '10/20'.obs;
  final codigo = 'xxx'.obs;

}

class CartaoModel{

  CartaoModel({ banco, numero, nome, validade, codigo });

  final rx = RxCartaoModel();

  get nome => rx.nome.value;
  set nome(value) => rx.nome.value = value;

  get numero => rx.numero.value;
  set numero(value) => rx.numero.value = value;

  set banco(value) => rx.banco.value = value;
  get banco => rx.banco.value;

  get validade => rx.validade.value;
  set validade(value) => rx.validade.value = value;

  get codigo => rx.codigo.value;
  set codigo(value) => rx.validade.value = value;

  CartaoModel.fromJson(Map<String, dynamic> json){
      this.numero = json['numero'];
      this.nome = json['nome'];
      this.validade = json['validade'];
      this.codigo = json['codigo'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['nome'] = this.nome;
    data['validade'] = this.validade;
    data['codigo'] = this.codigo;
    return data;
  }
}