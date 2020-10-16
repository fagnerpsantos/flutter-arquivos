import 'dart:math';

import 'package:lifepet_app/models/usuario_model.dart';
import 'package:lifepet_app/utils/file_util.dart';

class UsuarioService {
  Random random = new Random();
  List<Usuario> _usuarioList = [];

  void addUsuario(Usuario usuario){
    final newUsuario = Usuario(
      id: random.nextInt(1000),
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
    );
    FileUtil.getUsuario(usuario.email).then((value) {
      if (value == null) {
        FileUtil.inserir(newUsuario);
      } else {
        print("email já existe");
      }
    }
    );
  }

  void getUsuarios(){
    FileUtil.getUsuarios();
  }
}