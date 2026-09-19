import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;                       // <- received via constructor
  const DetailScreen({super.key, required this.movie});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            // back arrow here auto-calls Navigator.pop(context)
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: movie.color),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Text('${movie.matchPercent}% Match  ·  '
                       '${movie.year}  ·  ${movie.maturity}  ·  ${movie.duration}'),
                  // ...Play button, Download button, description...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
