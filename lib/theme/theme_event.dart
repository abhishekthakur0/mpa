import 'package:equatable/equatable.dart';
import 'package:mpa/theme/theme.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeToggleDark extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class ThemeToggleLight extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class ThemeToggle extends ThemeEvent {
  final ThemeState currentTheme;
  const ThemeToggle(this.currentTheme);
  @override
  List<Object> get props => [];
}
