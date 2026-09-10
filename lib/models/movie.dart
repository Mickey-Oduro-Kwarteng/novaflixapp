import 'package:flutter/material.dart';
 
class Movie {
  final String title;
  final String genre;
  final int year;
  final String maturity;   // e.g. "PG-13"
  final String duration;   // e.g. "1h 58m"
  final int matchPercent;  // e.g. 98 -> "98% Match"
  final String description;
  final Color color;       // poster placeholder colour
 
  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.maturity,
    required this.duration,
    required this.matchPercent,
    required this.description,
    required this.color,
  });
}
 
class Category {
  final String name;
  final List<Movie> movies;
  const Category({required this.name, required this.movies});
}
