class Usuario {
  String nome;
  String email;
  String senha;
  int id;

  Usuario({
    this.nome,
    this.email,
    this.senha,
    this.id
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email
    };
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        email = json['email'] as String,
        nome = json['nome'] as String,
        senha = json['senha'] as String;

}