import 'package:flutter/material.dart';

@immutable
class TodoModel {
  final int id;
  final String title;

  const TodoModel({
    required this.id,
    required this.title,
  });
}
