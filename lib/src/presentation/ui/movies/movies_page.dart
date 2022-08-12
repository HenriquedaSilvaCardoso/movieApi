import 'package:all_in_one/src/presentation/ui/movies/widgets/drawer_movies.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar_movies.dart';
import 'widgets/body_movies.dart';

class MoviesPage extends StatelessWidget {
   MoviesPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const DrawerMovies(),
      appBar: AppBarMovies(formKey: formKey,),
      body: const BodyMovies(),
    );
  }
}

