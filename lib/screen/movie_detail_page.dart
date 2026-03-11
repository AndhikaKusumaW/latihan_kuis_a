import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            /// Poster
            Image.network(
              movie.imgUrl,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    "${movie.title} (${movie.year})",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// Director
                  Text(
                    "Directed by ${movie.director}",
                    style: const TextStyle(
                      color: Colors.grey
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// Sypnosis 
                  Text(movie.synopsis),

                  const SizedBox(height: 12),

                  /// Genre
                  Text(
                    "Genre: ${movie.genre}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Casts
                  Text(
                    "Casts: ${movie.casts.join(", ")}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// Rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star, 
                        color: Colors.orange
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      Text(
                        "Rated ${movie.rating}/10",
                      ),
                    ],
                  ),

                  const SizedBox(height: 200),

                  /// Btn Wikipedia
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){

                      },
                      child: const Text("Go to Wikipedia"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}