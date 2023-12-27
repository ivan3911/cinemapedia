
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {
    
   final initialLoading = ref.watch(initialLoadingProvider);

   if ( initialLoading ) return const FullScreenLoader() ;


    final moviesSlideShowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upComingMovies = ref.watch( upcomingMoviesProvider );

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
        (context, index) {
           return Column(
        children: [
    
          // const CustomAppbar(),
          
          MoviesSlideshow(movies: moviesSlideShowMovies),
    
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines', 
            subTitle: 'Lunes 20',
            loadNextPage: () => ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage()
          ),
    
          MovieHorizontalListview(
            movies: upComingMovies,
            title: 'Proximamente', 
            subTitle: 'En este mes',
            loadNextPage: () => ref.read( upcomingMoviesProvider.notifier ).loadNextPage()
          ),
    
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populares', 
            // subTitle: '',
            loadNextPage: () => ref.read( popularMoviesProvider.notifier ).loadNextPage()
          ),
    
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Mejor Calificadas', 
            subTitle: 'Desde siempre',
            loadNextPage: () => ref.read( topRatedMoviesProvider.notifier ).loadNextPage()
          ),
    
         const SizedBox(height: 50,)
        ],
      );
    
          },
          childCount: 1 
        )),


      ]  
    );
  }
}