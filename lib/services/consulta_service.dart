import 'dart:math';
import 'package:lifepet_app/models/consulta_model.dart';
import 'package:lifepet_app/utils/file_util.dart';
import 'dart:convert';


class ConsultaService {
  Random random = new Random();
  List<Consulta> _consultaList = [];
  List<Consulta> _consultaPet = [];
  int indexRemover;


  void addConsulta(Consulta consulta){
    FileUtil.insertData("consulta", consulta.toJson());
  }

  Future<List> getAllConsultas() async {
    final dataList = await FileUtil.getData("consulta");
    _consultaList = dataList.map((consultas) =>
        Consulta.fromJson(jsonDecode(consultas))).toList();
    return _consultaList;
  }

  Future<List> getConsultasPet(String id) async {
    final dataList = await FileUtil.getData("consulta");
    _consultaList = dataList.map((consultas) =>
        Consulta.fromJson(jsonDecode(consultas))).toList();
    _consultaPet = _consultaList.where((consulta) => consulta.pet == id).toList();
    return _consultaPet;
  }

  Future<void> removeConsultaPet(String id) async {
    final dataList = await FileUtil.getData("consulta");
    _consultaList = dataList.map((consultas) =>
        Consulta.fromJson(jsonDecode(consultas))).toList();
    indexRemover = _consultaList.indexWhere((consulta) => consulta.id == id);
    FileUtil.removeData("consulta", indexRemover);
  }

}