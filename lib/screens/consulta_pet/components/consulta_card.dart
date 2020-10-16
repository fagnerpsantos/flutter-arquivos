import 'package:flutter/material.dart';
import 'package:lifepet_app/models/consulta_model.dart';

Widget consultaCard(BuildContext context, int index, Consulta consulta) {
  return Card(
    elevation: 8.0,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.redAccent)
            ),
          ),
          child: Icon(Icons.healing, color: Colors.redAccent,),
        ),
        title: Text(
          consulta.titulo,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          consulta.data,
        ),
      ),
    ),
  );
}