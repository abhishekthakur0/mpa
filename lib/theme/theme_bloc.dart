import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpa/firestore_instance_provider.dart';

import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.lightTheme) {
    getThemeType().then((themeType) {
      if (themeType != null) {
        if (themeType == "dark") {
          add(ThemeToggle(ThemeState.lightTheme));
        } else {
          add(ThemeToggle(ThemeState.darkTheme));
        }
      }
    });

    on<ThemeToggle>((event, emit) {
      if (event.currentTheme == ThemeState.lightTheme) {
        emit(ThemeState.darkTheme);
        storeThemeType("dark");
      } else {
        emit(ThemeState.lightTheme);
        storeThemeType("light");
      }
    });
  }

  void storeThemeType(String themeType) {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestoreProvider.instance
        .collection("users")
        .doc(user!.uid)
        .set({"theme": themeType});
  }

  Future<String?> getThemeType() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final themeType = await FirebaseFirestoreProvider.instance
          .collection("users")
          .doc(user.uid)
          .get()
          .then((value) => value.data()?["theme"]);
      return themeType;
    }
    return null;
  }
}
