import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:asyncdemo/model.dart';
import 'package:asyncdemo/repository.dart';

final myRepositoryProvider = Provider<IRepository<TodoModel>>(
  (ref) => Repository(),
);
