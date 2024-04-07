import 'package:flutter/material.dart';

import '../modules/detail/bloc/detail.dart';
import '../modules/detail/view/detail_page.dart';
import '../modules/home/bloc/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final receivedRoute = settings.name;
    // Make case for detail page
    final splitRoute = receivedRoute!.split('/');
    if (splitRoute[1] == 'detail') {
      final songId = splitRoute[2];
      final homeBloc = settings.arguments as HomeBloc;
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (BuildContext context) => DetailBloc(homeBloc: homeBloc),
          child: DetailPage(
            id: songId,
          ),
        ),
      );
    }
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
