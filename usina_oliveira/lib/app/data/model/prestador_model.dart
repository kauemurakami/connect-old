class PrestadorModel {
  
  int id;
  String nome;
  String telefone;
  String endereco;
  String cnpj;
  String ramo;

  PrestadorModel(
      {this.id, this.nome, this.telefone, this.cnpj, this.endereco, this.ramo});

  PrestadorModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.telefone = json['telefone'];
    this.cnpj = json['cnpj'];
    this.endereco = json['endereco'];
    this.ramo = json['ramo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['cnpj'] = this.cnpj;
    data['endereco'] = this.endereco;
    data['ramo'] = this.ramo;
    return data;
  }
}
