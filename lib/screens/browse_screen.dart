int _currentIndex = 0;
 
final List<Widget> _tabs = const [
  _HomeTab(),
  _PlaceholderTab(icon: Icons.search,   label: 'Search'),
  _PlaceholderTab(icon: Icons.upcoming, label: 'Coming Soon'),
  _PlaceholderTab(icon: Icons.download, label: 'Downloads'),
  _PlaceholderTab(icon: Icons.person,   label: 'Profile'),
];
 
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: IndexedStack(index: _currentIndex, children: _tabs),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => setState(() => _currentIndex = index), // NO Navigator!
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),     label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search),   label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.upcoming), label: 'Coming Soon'),
        BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
        BottomNavigationBarItem(icon: Icon(Icons.person),   label: 'Profile'),
      ],
    ),
  );
}
void _openDetail(BuildContext context, Movie movie) {
  Navigator.pushNamed(context, '/detail', arguments: movie);
}
 
// inside the horizontal ListView.builder:
GestureDetector(
  onTap: () => onTapMovie(movie),     // -> _openDetail(context, movie)
  child: Container(
    width: 100,
    decoration: BoxDecoration(
      color: movie.color,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Center(child: Text(movie.title.toUpperCase())),
  ),
)
IconButton(
  icon: const Icon(Icons.logout),
  onPressed: () => Navigator.pushNamedAndRemoveUntil(
      context, '/login', (route) => false),
)
