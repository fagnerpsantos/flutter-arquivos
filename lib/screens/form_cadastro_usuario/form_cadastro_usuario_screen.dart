import 'package:flutter/material.dart';
import 'package:lifepet_app/models/usuario_model.dart';
import 'package:lifepet_app/screens/login/login_screen.dart';
import 'package:lifepet_app/services/usuario_service.dart';

class FormCadastroUsuarioScreen extends StatefulWidget {

  @override
  _FormCadastroUsuarioScreenState createState() => _FormCadastroUsuarioScreenState();
}

class _FormCadastroUsuarioScreenState extends State<FormCadastroUsuarioScreen> {
  final UsuarioService _usuarioService = UsuarioService();
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do Usuário"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  obscureText: true,
                  controller: _senhaController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Usuario newUsuario = Usuario(
                            nome: _nomeController.text,
                            email: _emailController.text,
                            senha: _senhaController.text);
                        _usuarioService.addUsuario(newUsuario);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                      color: Colors.redAccent,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

