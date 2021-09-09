import 'package:flutter/material.dart';
import 'package:pelicula_app/prividers/movie_provider.dart';
import 'package:pelicula_app/search/search_delegate.dart';
import 'package:pelicula_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    // print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en el cine'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => showSearch(
							context: context, 
							delegate: MovieSearchDelegate()
						),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              titulo: "Populares",
              onNexPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
