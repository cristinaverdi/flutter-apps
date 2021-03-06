import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartUp Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _favourites = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Center(
          child: Text('Startup Name Generator'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushFavourites,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int rowIndex) {
          if (rowIndex.isOdd) {
            return Divider();
          }
          final int index = rowIndex ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _favourites.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _favourites.remove(pair);
          } else {
            _favourites.add(pair);
          }
        });
      },
    );
  }

  void _pushFavourites() {
    var navigator = Navigator.of(context);
    navigator.push(_favouritesRoute());
  }

  MaterialPageRoute _loginRoute() {
    return MaterialPageRoute<void>(builder: (BuildContext context) {
      return _loginPage();
    });
  }

  Scaffold _loginPage() {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pushLogin() {
    var navigator = Navigator.of(context);
    navigator.push(_loginRoute());
  }

  MaterialPageRoute _favouritesRoute() {
    return MaterialPageRoute<void>(
      // Add 20 lines from here...
      builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _favourites.map(
          mountTiles,
        );
        return favouritesPage(favouritesTiles(context, tiles));
      },
    );
  }

  ListTile mountTiles(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  List<Widget> favouritesTiles(BuildContext context, Iterable<ListTile> tiles) {
    return ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
  }

  Scaffold favouritesPage(List<Widget> divided) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Center(
          child: Text('Saved Suggestions'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushLogin,
          ),
        ],
      ),
      body: ListView(
        children: divided,
      ),
    );
  }
}
