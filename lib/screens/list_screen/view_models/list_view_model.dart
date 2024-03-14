import 'package:flutter/material.dart';

abstract class IdentifiableModel {
  int get id;
  String get name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }
}

abstract class ListViewModel<Model extends IdentifiableModel> {
  String get title;
  Future<List<Model>> getModelsList();

  void onTap(int id, BuildContext context);
}