import 'dart:math';
import 'package:lifepet_app/models/consulta_model.dart';
import 'package:lifepet_app/utils/file_util.dart';
import 'dart:convert';


class ConsultaService {
  Random random = new Random();
  List<Consulta> _consultaList = [];


  void addConsulta(Consulta consulta){
    FileUtil.insertData("consulta", consulta.toJson());
  }

  Future<List> getAllConsultas() async {
    final dataList = await FileUtil.getData("consulta");
    _consultaList = dataList.map((consultas) => Consulta.fromJson(jsonDecode(consultas))).toList();
    return _consultaList;
  }


}