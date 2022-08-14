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
      Response res = await Dio().get("http://169.254.66.42:1000");
      return TodoModel(id: 1, title: res.toString());
    } on DioError catch (e) {
      debugPrint("DEBUG error message === $e");
      throw Error();
    }
  }
}
