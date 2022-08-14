import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:asyncdemo/model.dart';
import 'package:asyncdemo/repository.dart';

final _myRepositoryProvider = Provider<IRepository<TodoModel>>(
  (ref) => Repository(),
);

final myFutureProvider = FutureProvider.autoDispose<TodoModel>(
  (ref) => ref.watch(_myRepositoryProvider).get(),
);
