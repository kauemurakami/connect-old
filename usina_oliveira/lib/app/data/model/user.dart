class UserModel {
  int id;
  String nome;
  String email;
  String senha;
  bool status; //de pagamento
  bool isAdmin;

  UserModel(
      {this.id,
      this.nome,
      this.email,
      this.senha,
      this.status = false,
      this.isAdmin = false});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.email = json['email'];
    this.senha = json['senha'];
    this.status = json['status'];
    this.isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
