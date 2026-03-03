import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final countProvider = StateProvider<int>((ref) => 0);

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: 130,
          width: 300,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final count = ref.watch(countProvider);
                  return Text(
                    count.toString(),
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// ➕ Increment Button (No Rebuild Needed)
                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () {
                          print("1st Button");
                          ref
                              .read(countProvider.notifier)
                              .update((state) => state + 1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.black,
                        ),
                        child: const Icon(Icons.add),
                      );
                    },
                  ),

                  const SizedBox(width: 10),

                  /// ➖ Decrement Button
                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () {
                          print("2nd Button");
                          ref
                              .read(countProvider.notifier)
                              .update((state) => state - 1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.black,
                        ),
                        child: const Icon(Icons.remove),
                      );
                    },
                  ),

                  const SizedBox(width: 10),

                  /// 🔄 Reset Button
                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () {
                          print("3rd Button");
                          ref.read(countProvider.notifier).state = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                        ),
                        child: const Icon(Icons.replay),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
