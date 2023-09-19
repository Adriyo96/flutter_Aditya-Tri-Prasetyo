import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Setting'),
            )
          ],
        ),
      ),
      body: ListView(
          children: const <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('L'),
              ),
              title: Text(
                'Leanne Graham',
              ),
              subtitle: Text('1-770-736-8031 x56442'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('E'),
              ),
              title: Text(
                'Ervin Howell',
              ),
              subtitle: Text('010-692-6593 x09125'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('C'),
              ),
              title: Text(
                'Clementine Bauch',
              ),
              subtitle: Text('1-463-123-4447'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('P'),
              ),
              title: Text(
                'Patricia Lebsack',
              ),
              subtitle: Text('493-170-9623 x156'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('C'),
              ),
              title: Text(
                'Chelsey Dietrich',
              ),
              subtitle: Text('(254)954-1289'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('M'),
              ),
              title: Text(
                'Mrs. Dennis Schulist',
              ),
              subtitle: Text('1-447-935-8478 x6430'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('K'),
              ),
              title: Text(
                'Kurtis Weissnat',
              ),
              subtitle: Text('210.067.6132'),
            ),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ]),
    );
  }
}
