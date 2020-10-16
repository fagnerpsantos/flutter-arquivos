import 'dart:math';
import 'package:lifepet_app/models/anotacao_model.dart';
import 'package:lifepet_app/utils/file_util.dart';
import 'dart:convert';


class AnotacaoService {
  Random random = new Random();
  List<Anotacao> _anotacaoList = [];
  List<Anotacao> _anotacaoPet = [];


  void addAnotacao(Anotacao anotacao){
    FileUtil.insertData("anotacao", anotacao.toJson());
  }

  Future<List> getAllAnotacaos() async {
    final dataList = await FileUtil.getData("anotacao");
    _anotacaoList = dataList.map((anotacaos) => Anotacao.fromJson(jsonDecode(anotacaos))).toList();
    return _anotacaoList;
  }

  Future<List> getAnotacaosPet(String id) async {
    final dataList = await FileUtil.getData("anotacao");
    _anotacaoList = dataList.map((anotacaos) => Anotacao.fromJson(jsonDecode(anotacaos))).toList();
    _anotacaoPet = _anotacaoList.where((anotacao) => anotacao.pet == id).toList();
    return _anotacaoPet;
  }


}