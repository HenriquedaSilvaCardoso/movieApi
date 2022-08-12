import 'package:all_in_one/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerMovies extends HookConsumerWidget {
  const DrawerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Movies',
              style: TextStyle(fontSize: 30),
            ),
          ),
          ListTile(
            title: const Text('Trazer filmes diários'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('day');
            },
          ),
          ListTile(
            title: const Text('Trazer filmes semanais'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('week');
            },
          ),
        ],
      ),
    );
  }
}
