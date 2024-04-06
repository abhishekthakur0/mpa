import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.lightTheme) {
    on<ThemeToggle>((event, emit) {
      if (event.currentTheme == ThemeState.lightTheme) {
        emit(ThemeState.darkTheme);
      } else {
        emit(ThemeState.lightTheme);
      }
    });
  }
}
