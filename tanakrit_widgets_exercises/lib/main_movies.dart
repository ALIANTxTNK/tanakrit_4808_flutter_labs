// ============================================
// AI DOCUMENTATION
// Tool: ChatGPT 
// Prompt: Why my i have black screen when run this code?
// ============================================
//
// EXPLANATION (in my own words):
// This code show movie list with light and dark theme support. and year, genre, director, rating of each movie. and when you click on movie it show snackbar with recommendation message based on rating. and you can click dismiss button to hide snackbar.
//
// VERIFICATION:
// App show movie list with 3 movies. and when click on movie it show snackbar with correct message based on rating. and dismiss button hide snackbar. and light and dark theme work correctly.
//
// MODIFICATIONS:
// add themeMode: ThemeMode.dark, to force dark mode for testing
// change home: const MoviesList(), to home: const MovieAppHomePage(), to match class name
// fix text style in snackbar to avoid null error
// Author: Tanakrit Waree
// Date: 2025-01-14

import 'package:flutter/material.dart';
import 'package:tanakrit_widgets_exercises/models/movie_model.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.light,

      home: const MovieAppHomePage(), // ⭐ แก้จอดำ
    );
  }
}

class MovieAppHomePage extends StatelessWidget {
  const MovieAppHomePage({super.key});

  void _handleMovieRecommendation(BuildContext context, Movie movie) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          movie.rating >= 8.0
              ? "This is a highly rated movie!"
              : (movie.rating >= 6.0
                  ? "This is a good movie"
                  : "This movie might need improvement"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "Dismiss",
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      const Movie(
        title: "The Shawshank Redemption",
        year: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      const Movie(
        title: "Inception",
        year: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      const Movie(
        title: "Disaster Movie",
        year: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: movies.map((movie) {
          return ListTile(
            leading: Icon(
              Icons.movie,
              color: Theme.of(context).colorScheme.primary,
            ),

            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movie.year} • ${movie.genre}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  'Director: ${movie.director}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: movie.rating >= 7.0
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  movie.rating.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: movie.rating >= 7.0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                      ),
                ),
              ],
            ),

            onTap: () => _handleMovieRecommendation(context, movie),
          );
        }).toList(),
      ),
    );
  }
}
