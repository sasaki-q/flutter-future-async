import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:asyncdemo/model.dart';
import 'package:asyncdemo/provider.dart';
import 'package:asyncdemo/async_value/application.dart';

final myAsyncProvider =
    StateNotifierProvider.autoDispose<MyApplication, AsyncValue<TodoModel>>(
        (ref) => MyApplication(repository: ref.watch(myRepositoryProvider)));
