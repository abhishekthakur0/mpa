import 'package:flutter/material.dart';
import 'package:mpa/modules/home/bloc/home.dart';

import '../../../theme/theme.dart';
import '../../auth/bloc/auth.dart';
import '../widgets/item_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        if (state is HomeInitial) {
          BlocProvider.of<HomeBloc>(context).add(HomeLoad());
        }
        if (state is HomeLoaded) {
          final songs = state.songs;
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                'Discover Songs',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                PopupMenuButton(itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 'logout',
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'theme-change',
                      child: Text(
                        'Switch Theme',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ];
                }, onSelected: (value) {
                  if (value == 'logout') {
                    BlocProvider.of<AuthBloc>(context).add(const AuthSignOut());
                  }
                  if (value == 'theme-change') {
                    final currentTheme =
                        BlocProvider.of<ThemeBloc>(context).state;
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeToggle(currentTheme));
                  }
                }),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Search bar widget
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        onChanged: (value) {
                          // Add search functionality here
                          BlocProvider.of<HomeBloc>(context).add(
                            HomeSearch(value),
                          );
                        },
                      ),
                    ),
                    // Add a SizedBox with a height of 10
                    const SizedBox(height: 20),
                    // Songs list widget
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        itemCount: songs.length,
                        itemBuilder: (context, index) {
                          final item = songs[index];
                          return MusicItemWidget(
                            item: item,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
