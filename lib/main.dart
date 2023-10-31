import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Ini adalah indeks halaman saat ini.

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Bar Example'),
      ),
      body: _pages[_currentIndex], // Ini akan menampilkan halaman sesuai dengan indeks saat ini.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Saat mengklik item di bottom navigation, kita perbarui indeks saat ini.
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // Item 1 dengan gambar
        ListTileWithImage(
          title: 'Item 1',
          imageName: 'bloggg.jpg', // Ganti dengan nama gambar yang sesuai
          onTap: () {
            // Tindakan yang diambil saat mengklik Item 1
            // Misalnya, pindah ke halaman lain
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetailPage(itemName: 'Item 1'),
            ));
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Tindakan yang diambil saat mengklik Item 2
            // Misalnya, pindah ke halaman lain
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetailPage(itemName: 'Item 2'),
            ));
          },
        ),
        ListTile(
          title: Text('Item 3'),
          onTap: () {
            // Tindakan yang diambil saat mengklik Item 3
            // Misalnya, pindah ke halaman lain
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetailPage(itemName: 'Item 3'),
            ));
          },
        ),
        // Tambahkan lebih banyak ListTile sesuai kebutuhan Anda
      ],
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  final String itemName;

  ItemDetailPage({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $itemName'),
      ),
      body: Center(
        child: Text('Detail $itemName'),
      ),
    );
  }
}

class ListTileWithImage extends StatelessWidget {
  final String title;
  final String imageName;
  final VoidCallback onTap;

  ListTileWithImage({
    required this.title,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Image.asset(
            imageName,
            width: 48, // Sesuaikan lebar gambar sesuai kebutuhan Anda
            height: 48, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
          ),
          SizedBox(width: 16), // Spasi horizontal
          Text(title),
        ],
      ),
      onTap: onTap,
    );
  }
}



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Search Page'),
        SizedBox(height: 20), // Spasi vertikal
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Cari...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Profile Page'),
          SizedBox(height: 20), // Spasi vertikal
          UserInfoCard(
            username: 'john_doe', // Gantilah dengan nama pengguna yang sesuai
            email: 'johndoe@example.com', // Gantilah dengan alamat email yang sesuai
          ),
        ],
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String username;
  final String email;

  UserInfoCard({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Spasi vertikal
            ListTile(
              title: Text('Username:'),
              subtitle: Text(username),
            ),
            ListTile(
              title: Text('Email:'),
              subtitle: Text(email),
            ),
          ],
        ),
      ),
    );
  }
}
