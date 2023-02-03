import 'package:flutter/material.dart';
import 'package:pratice/screens/feed_screen.dart';
import 'package:pratice/screens/profile_screen.dart';

import 'constants/screen_size.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavitem = [
    BottomNavigationBarItem(icon:Icon(Icons.home), label:'fd'),
    BottomNavigationBarItem(icon:Icon(Icons.search), label: 'fd'),
    BottomNavigationBarItem(icon:Icon(Icons.add), label:'fd'),
    BottomNavigationBarItem(icon:Icon(Icons.healing), label: 'df'),
    BottomNavigationBarItem(icon:Icon(Icons.account_circle), label: 'df'),
  ];

  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    FeedScreen(),
    Container(color: Colors.amberAccent,),
    Container(color: Colors.blueAccent,),
    Container(color: Colors.greenAccent,),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if(size==null)
      size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavitem,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onBtmItemClick,
      ),
    );
  }

  void _onBtmItemClick(int index){
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
