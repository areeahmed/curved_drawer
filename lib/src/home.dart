import 'package:curved_drawer/src/people.dart';
import 'package:curved_drawer/src/trending.dart';
import 'package:curved_drawer/src/tv.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  double leftWidth = 75.0;

  int leftTextColor = 1;

  int leftBackgroundColor = 0;
  //! both width most be less than 100
  double rightWidth = 100.0;

  int rightTextColor = 1;

  int rightBackgroundColor = 0;

  final List<Color> colorPallete = <Color>[
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.blueAccent,
    Colors.red,
    Colors.redAccent,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.lime,
    Colors.green
  ];

  final List<DrawerItem> _drawerItems = <DrawerItem>[
    const DrawerItem(icon: Icon(Icons.people), label: "People"),
    const DrawerItem(icon: Icon(Icons.trending_up), label: "Trending"),
    const DrawerItem(icon: Icon(Icons.tv), label: 'TV'),
    const DrawerItem(icon: Icon(Icons.work), label: "Work"),
    const DrawerItem(icon: Icon(Icons.web), label: 'Web'),
    const DrawerItem(icon: Icon(Icons.videogame_asset), label: 'Video Game'),
    const DrawerItem(icon: Icon(Icons.book), label: "Book"),
    const DrawerItem(icon: Icon(Icons.call), label: "Telephone")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curved Drawer'),
      ),
      drawer: CurvedDrawer(
        //* Current Index
        index: index,
        //* Width of the Drawer
        width: leftWidth,
        //* Color of the drawer
        color: colorPallete[leftBackgroundColor],
        //* Button background color
        buttonBackgroundColor: colorPallete[leftBackgroundColor],
        //* label color
        labelColor: colorPallete[leftTextColor],
        //* Items
        items: _drawerItems,
        //* On Tap what's happening
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),

      ///
      ///
      ///* Curved Drawer
      ///
      ///
      endDrawer: CurvedDrawer(
        index: index,
        width: rightWidth,
        color: colorPallete[rightBackgroundColor],
        buttonBackgroundColor: colorPallete[rightBackgroundColor],
        labelColor: colorPallete[rightTextColor],
        isEndDrawer: true,
        items: _drawerItems,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),

      ///
      ///
      ///* Curved Drawer is until here
      ///
      ///
      body: (index == 0)
          ? const People()
          : (index == 1)
              ? const Trending()
              : const Tv(),
    );
  }
}
