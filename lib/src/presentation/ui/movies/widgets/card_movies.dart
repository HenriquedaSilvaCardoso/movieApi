import 'package:flutter/material.dart';

import '../../../../../shared/utils/auxiliary_methods.dart';
import '../../../../domain/entities/movie_entity.dart';

class CardMovies extends StatelessWidget {
  const CardMovies({
    Key? key,
    required this.movie,
    required this.colorMap,
  }) : super(key: key);

  final MovieEntity movie;
  final Map<String, Color?> colorMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'http://image.tmdb.org/t/p/original${movie.posterPath}',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 275,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes !=
                                null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 255,
              left: 10,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 8, 28, 34),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 2000),
                        tween: Tween<double>(
                          begin: 0.0,
                          end: movie.voteAverage / 10,
                        ),
                        builder: (BuildContext context, dynamic value,
                            Widget? child) {
                          return CircularProgressIndicator(
                            strokeWidth: 2,
                            value: value,
                            color: colorMap['primaryColor'],
                            backgroundColor: colorMap['secondaryColor'],
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 2000),
                          tween: Tween<double>(
                            begin: 0.0,
                            end: movie.voteAverage * 10,
                          ),
                          builder: (BuildContext context, dynamic value,
                              Widget? child) {
                            return Text(
                              (value).toStringAsFixed(0),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            );
                          },
                        ),
                        const Text(
                          '%',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: 15,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Colors.white.withOpacity(0.5),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            movie.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            formatDate(movie.releaseDate),
            style: const TextStyle(
              color: Color.fromARGB(255, 102, 102, 102),
            ),
          ),
        ),
      ],
    );
  }
}
