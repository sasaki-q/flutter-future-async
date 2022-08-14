import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:asyncdemo/model.dart';

abstract class IRepository<T> {
  Future<T> get();
}

class Repository implements IRepository<TodoModel> {
  @override
  Future<TodoModel> get() async {
    try {
      Response res = await Dio().get("");
      debugPrint("DEBUG success response === $res");
      return TodoModel(id: 1, title: res.toString());
    } catch (err) {
      debugPrint("DEBUG error message === $err");
      throw Error();
    }
  }
}
