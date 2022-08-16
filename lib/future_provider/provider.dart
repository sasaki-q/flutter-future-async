import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:asyncdemo/model.dart';
import 'package:asyncdemo/provider.dart';

final myFutureProvider = FutureProvider.autoDispose<TodoModel>(
  (ref) => ref.watch(myRepositoryProvider).get(),
);
