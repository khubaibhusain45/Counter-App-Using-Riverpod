import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'variable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumer Widget"),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final slides = ref.watch(
                sliderProvider.select((state) => state.showPassword),
              );
              return InkWell(
                onTap: () {
                  final SP = ref.read(sliderProvider.notifier);
                  SP.state = SP.state.copyWith(showPassword: !slides);
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: slides
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.visibility_off),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slides = ref.watch(sliderProvider);
              return Container(
                color: Colors.brown.withOpacity(slides.slider),
                height: 200,
                width: 200,
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slides = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Slider(
                value: slides,
                onChanged: (value) {
                  final SP = ref.read(sliderProvider.notifier);
                  SP.state = SP.state.copyWith(slider: value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
