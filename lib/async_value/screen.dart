import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:asyncdemo/model.dart';
import 'package:asyncdemo/async_value/provider.dart';
import 'package:asyncdemo/async_value/application.dart';

class AsyncValueScreen extends HookConsumerWidget {
  const AsyncValueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<TodoModel> value = ref.watch(myAsyncProvider);
    MyApplication application = ref.watch(myAsyncProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("async value screen"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: value.when(
          data: (data) => Text(data.title),
          error: (e, _) {
            debugPrint("DEBUG error message === $e");

            return const Text("something went wrong");
          },
          loading: () {
            Future(
              () async => await Future.delayed(
                const Duration(seconds: 3),
                () async => await application.get(),
              ),
            );

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
