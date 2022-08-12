import 'package:all_in_one/src/presentation/ui/movies/movies_page.dart';
import 'package:all_in_one/src/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/auxiliary_methods.dart';

class AppBarMovies extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMovies({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<ScaffoldState> formKey;

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     MaterialButton(
          //       onPressed: () {
          //         formKey.currentState!.openDrawer();
          //       },
          //       child: const GradientText(
          //         'TMDB',
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 30,
          //             letterSpacing: 3),
          //         gradient: LinearGradient(
          //           colors: [
          //             Color.fromARGB(255, 143, 206, 161),
          //             Color.fromARGB(255, 59, 190, 201),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: 60,
          //       height: 22,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(200),
          //         gradient: const LinearGradient(
          //           colors: [
          //             Color.fromARGB(255, 59, 190, 201),
          //             Color.fromARGB(255, 1, 179, 228)
          //           ],
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          PopupMenuButton(
            // Callback that sets the selected popup menu item
            child: const Text(
              'Filmes',
              style: TextStyle(fontSize: 15),
            ),
            onSelected: (item) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SplashPage();
                  },
                ),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 'Memes1',
                child: Text('Item 1'),
              ),
              const PopupMenuItem(
                value: 'Memes2',
                child: Text('Item 2'),
              ),
              const PopupMenuItem(
                value: 'Memes3',
                child: Text('Item 3'),
              ),
              const PopupMenuItem(
                value: 'Memes',
                child: Text('Item 4'),
              ),
            ],
          ),
          const Text(
            'Séries',
            style: TextStyle(fontSize: 15),
          ),
          const Text(
            'Pessoas',
            style: TextStyle(fontSize: 15),
          ),
          const Text(
            'Mais',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 3, 37, 65),
    );
  }
}
