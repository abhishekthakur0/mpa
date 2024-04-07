import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(this.themeData);

  static ThemeState get darkTheme => ThemeState(
        ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'Quicksand',
              ),
          // Customize dark theme properties
          primaryColor: const Color(0xFFEADDFF),
        ),
      );

  static ThemeState get lightTheme => ThemeState(
        ThemeData.light(
          useMaterial3: true,
        ).copyWith(
          textTheme: ThemeData.light().textTheme.apply(
                fontFamily: 'Quicksand',
              ),
          // Customize light theme properties
        ),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}
