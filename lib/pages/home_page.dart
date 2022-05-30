import 'package:films/providers/movies_provider.dart';
import 'package:films/search/search_delegate.dart';
import 'package:films/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //anda al arbol de widgets traeme la instancia de moviesProvider y esa instancia colocala aca:
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Peliculas en cines')),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //slider de pelis
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
