import 'package:fgc7_pelcls_109/providers/movies_provider.dart';
import 'package:fgc7_pelcls_109/widgets/card_swiper.dart';
import 'package:fgc7_pelcls_109/widgets/movie_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principaes
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            //  Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies, // populares
              title: 'Populares!', //opcional
            ),
          ],
        ),
      ),
    );
  }
}
