import 'package:flutter/material.dart';

import '../helpers.dart';
import 'blog_list_view.dart';
import 'blog_detail_view.dart';

class HomeView extends StatefulWidget {
  static const route = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < UIHelpers.scaffoldBreakpoint) {
          return _HomeViewSmall();
        } else {
          return _HomeViewLarge();
        }
      },
    );
  }
}

class _HomeViewSmall extends StatefulWidget {
  @override
  _HomeViewSmallState createState() => _HomeViewSmallState();
}

class _HomeViewSmallState extends State<_HomeViewSmall> {
  static const _pageAnimationDuration = Duration(milliseconds: 600);
  static const _pageAnimationCurve = Curves.ease;
  final _pageViewController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blahblah'),
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [BlogListView(), Text('Placeholder')],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageViewController.animateToPage(
              index,
              duration: _pageAnimationDuration,
              curve: _pageAnimationCurve,
            );
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}

class _HomeViewLarge extends StatefulWidget {
  @override
  _HomeViewLargeState createState() => _HomeViewLargeState();
}

class _HomeViewLargeState extends State<_HomeViewLarge> {
  static const _pageAnimationDuration = Duration(milliseconds: 600);
  static const _pageAnimationCurve = Curves.ease;
  final _pageViewController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blahblah'),
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                _pageViewController.animateToPage(
                  index,
                  duration: _pageAnimationDuration,
                  curve: _pageAnimationCurve,
                );
              });
            },
            groupAlignment: 0,
            labelType: NavigationRailLabelType.selected,
            leading: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.list),
                selectedIcon: Icon(Icons.list),
                label: Text('Feed'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.account_circle),
                selectedIcon: Icon(Icons.account_circle),
                label: Text('Profile'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PageView(
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [BlogGridView(), Text('Placeholder')],
            ),
          )
        ],
      ),
    );
  }
}
