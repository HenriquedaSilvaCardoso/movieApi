import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/utils/auxiliary_methods.dart';
import '../../../riverpod/movies/movies_provider.dart';
import 'card_movies.dart';

class BodyMovies extends HookConsumerWidget {
  const BodyMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNotifierProvider);
    return Visibility(
      visible: movies.isNotEmpty,
      replacement: Padding(
        padding: const EdgeInsets.all(15),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width ,
                    height: 275.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 125,
                    height: 20,
                    color: Colors.white,
                  ),
                ],
              );
            },
            itemCount: 10,
          ),
        ),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 0.50,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          movies.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
          return CardMovies(
            movie: movies[index],
            colorMap: getProgressColor(movies[index].voteAverage),
          );
        },
      ),
    );
  }
}
