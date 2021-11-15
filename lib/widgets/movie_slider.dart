import 'package:fgc7_pelcls_109/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    Key? key,
    required this.movies,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      // color: Colors.orange[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO Si no hay titulo, no deben mostrarse este widget
          if (this.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                this.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            // toma todo el tamaño disponible con expanded
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_, int index) => _MoviePoster(movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 160,
      // color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 115,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
