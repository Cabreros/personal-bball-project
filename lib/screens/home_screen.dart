import 'package:fantasybball_tools/screens/default_screen.dart';
import 'package:fantasybball_tools/screens/league_screen.dart';
import 'package:fantasybball_tools/screens/search_screen.dart';
import 'package:fantasybball_tools/screens/settings_screen.dart';
import 'package:fantasybball_tools/screens/team_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Fantasy Basketball Tools',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 30.0,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          DefaultScreen(),
          TeamScreen(),
          LeagueScreen(),
          SearchScreen(),
          SettingScreen()
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.black),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          },
          iconSize: 28.0,
          selectedFontSize: 14.0,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Team'),
              icon: Icon(
                Icons.person,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('League'),
              icon: Icon(
                Icons.people,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Search'),
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Settings'),
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
