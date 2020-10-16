import 'dart:convert';
import 'dart:io';
import 'package:lifepet_app/models/usuario_model.dart';
import 'package:path_provider/path_provider.dart';


class FileUtil {
  static Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/usuarios.json");
  }

  static Future<File> inserir(Usuario usuario) async {
    String dataUser = json.encode(usuario.toMap());

    final file = await getFile();
    return file.writeAsString(dataUser + '\n',
        mode: FileMode.append);
  }

  static Future<List<String>> getUsuarios() async {
    final file = await getFile();
    file.readAsString().then((value) =>
        print(value)
    );
  }

  static Future<Usuario> getUsuario(String email) async {
    final file = await getFile();
    LineSplitter ls = new LineSplitter();
    List<String> lines = await ls.convert(file.readAsStringSync());
    for (var i = 0; i < lines.length; i++) {
      var dados = jsonDecode(lines.toString());
      if (dados[i]["email"] == email){
        return Usuario(
          id: dados[i]["id"],
          nome: dados[i]["nome"],
          email: dados[i]["email"],
        );
      }
    }
  }
}