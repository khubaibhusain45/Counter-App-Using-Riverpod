import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slider_provider/slider.dart';

import 'CounterAppUI.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: MaterialApp(home: CounterApp()));
  }
}
