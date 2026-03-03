import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(showPassword: false, slider: 0.5);
});

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.showPassword, required this.slider});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      showPassword: showPassword ?? this.showPassword,
      slider: slider ?? this.slider,
    );
  }
}
