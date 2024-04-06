import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

enum ThemeEvent { toggleDark, toggleLight }

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.lightTheme) {
    on<ThemeEvent>((event, emit) {
      switch (event) {
        case ThemeEvent.toggleDark:
          emit(ThemeState.darkTheme);
          break;
        case ThemeEvent.toggleLight:
          emit(ThemeState.lightTheme);
          break;
      }
    });
  }
}
