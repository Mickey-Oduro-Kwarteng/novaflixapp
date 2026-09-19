import 'package:flutter/material.dart';
 
class Movie {
  final String title;
  final int year;
  final String maturity;   // e.g. "PG-13"
  final String duration;   // e.g. "1h 58m"
  final int matchPercent;  // e.g. 98 -> "98% Match"
  final Color color;       // poster placeholder colour
 
  const Movie({
    required this.title,
    required this.year,
    required this.maturity,
    required this.duration,
    required this.matchPercent,
    required this.color,
  });
}
 
class Category {
  final String name;
  final List<Movie> movies;
  const Category({required this.name, required this.movies});
}
// Featured title
final Movie featuredMovie = Movie(
  title: 'Shadow Protocol',
  matchPercent: 98,
  year: 2026,
  maturity: '16+',
  duration: '2h 12m',
  color: Colors.deepPurple,
);

// Trending Now
final List<Movie> trendingNow = [
  Movie(
    title: 'Shadow Protocol',
    matchPercent: 98,
    year: 2026,
    maturity: '16+',
    duration: '2h 12m',
    color: Colors.deepPurple,
  ),
  Movie(
    title: 'Neon Horizon',
    matchPercent: 95,
    year: 2025,
    maturity: '13+',
    duration: '1h 58m',
    color: Colors.blue,
  ),

];

// Popular on NovaFlix
final List<Movie> popularOnNovaFlix = [
  Movie(
    title: 'Beyond the Stars',
    matchPercent: 97,
    year: 2024,
    maturity: '13+',
    duration: '2h 20m',
    color: Colors.indigo,
  ),
  Movie(
    title: 'Hidden Truth',
    matchPercent: 94,
    year: 2025,
    maturity: '16+',
    duration: '1h 52m',
    color: Colors.teal,
  ),
  
];