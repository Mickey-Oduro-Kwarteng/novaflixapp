import 'package:flutter/material.dart';
import '../models/movie.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int _currentIndex = 0;

  late final List<Widget> _tabs = [
    _HomeTab(
      onTapMovie: _openDetail,
    ),
    const _PlaceholderTab(
      icon: Icons.search,
      label: 'Search',
    ),
    const _PlaceholderTab(
      icon: Icons.upcoming,
      label: 'Coming Soon',
    ),
    const _PlaceholderTab(
      icon: Icons.download,
      label: 'Downloads',
    ),
    _ProfileTab(
      onLogout: _logout,
    ),
  ];

  void _openDetail(Movie movie) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: movie,
    );
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upcoming),
            label: 'Coming Soon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// ============================================================
// HOME TAB
// ============================================================

class _HomeTab extends StatelessWidget {
  final void Function(Movie movie) onTapMovie;

  const _HomeTab({
    required this.onTapMovie,
  });

  @override
  Widget build(BuildContext context) {
    // Replace this with your existing home content.
    //
    // Example movie list:
    final movies = <Movie>[
      // Your existing Movie objects go here.
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Browse',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          if (movies.isNotEmpty)
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => onTapMovie(movie),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: movie.color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              movie.title.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          else
            const Center(
              child: Text('No movies available'),
            ),
        ],
      ),
    );
  }
}


// ============================================================
// PLACEHOLDER TAB
// ============================================================

class _PlaceholderTab extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PlaceholderTab({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


// ============================================================
// PROFILE TAB
// ============================================================

class _ProfileTab extends StatelessWidget {
  final VoidCallback onLogout;

  const _ProfileTab({
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),

          const SizedBox(height: 20),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}