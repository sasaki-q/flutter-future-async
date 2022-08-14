import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:asyncdemo/model.dart';
import 'package:asyncdemo/repository.dart';

class MyApplication extends StateNotifier<AsyncValue<TodoModel>> {
  final IRepository<TodoModel> repository;

  MyApplication({required this.repository}) : super(const AsyncValue.loading());

  Future<void> get() async {
    try {
      TodoModel res = await repository.get();
      state = AsyncData(res);
      return;
    } catch (err) {
      debugPrint("DEBUG error message === $err");
      state = AsyncError(err);
    }
  }
}
