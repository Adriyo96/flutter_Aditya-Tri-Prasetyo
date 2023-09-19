import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: const Text('My Flutter App'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))],
      ),
      body: ListView(
          children: const <Widget>[
            ListTile(
              title: Text(
                'Learn Flutter',
              ),
            ),
            Divider(
              height: 1.0,
              indent: 15.0,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Learn ReactJS',
              ),
            ),
            ListTile(
              title: Text(
                'Learn VueJS',
              ),
            ),
            Divider(
              height: 1.0,
              indent: 15.0,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Learn tailwind CSS',
              ),
            ),
            Divider(
              height: 1.0,
              indent: 15.0,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Learn UI/UX',
              ),
            ),
            Divider(
              height: 1.0,
              indent: 15.0,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Learn Figma',
              ),
            ),
            Divider(
              height: 1.0,
              indent: 15.0,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Learn Digital Marketing',
              ),
            ),
            Divider(
              height: 1.0,
              indent: 15.0,
              thickness: 1,
            ),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
        ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color(0xFF03DAC5),
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
