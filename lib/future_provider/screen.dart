import 'package:asyncdemo/future_provider/provider.dart';
import 'package:asyncdemo/model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FutureProviderScreen extends HookConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<TodoModel> value = ref.watch(myFutureProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("future provider screen"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: value.when(
          data: (data) => Text(data.title),
          error: (e, _) {
            debugPrint("DEBUG error message === $e");

            return const Text("something went wrong");
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
