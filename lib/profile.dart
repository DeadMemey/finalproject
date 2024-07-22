import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index, if necessary
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Untitled_1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.1),
            child: Text(
              'My Profile',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 219, 182, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/images.jpeg'),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 219, 182, 18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.8),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.white),
                    title: Text('My Account',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle My Account tap
                    },
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.white),
                    title: Text('Notifications',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Notifications tap
                    },
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.white),
                    title: Text('Favorites',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Favorites tap
                    },
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title:
                        Text('Settings', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Settings tap
                    },
                  ),
                  Divider(color: Colors.white),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title:
                        Text('Logout', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Handle Logout tap
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
