
class ServicoModel {

  String nome;
  int id;

  ServicoModel({this.id, this.nome});

  

  ServicoModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.nome = json['nome'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    return data;
  }
}