import 'package:card_swiper/card_swiper.dart';
import 'package:fgc7_pelcls_109/models/models.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    //  nos da informacion del contexto, dimensiones, orientacion etc...
    final size = MediaQuery.of(context).size;
    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.orange,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        // itemBuilder: ( BuildContext context, int index)
        itemBuilder: (_, int index) {
          final movie = movies[index];
          print(movie.fullPosterImg);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FadeInImage(
                placeholder: NetworkImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
              ),
            ),
          );
        },
      ),
    );
  }
}
