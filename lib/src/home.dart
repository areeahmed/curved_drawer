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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current index is $index',
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Left Width = $leftWidth"),
            Slider(
              label: "Left Drawer Width",
              activeColor: Colors.blue,
              min: 50.0,
              max: 100.0,
              divisions: 50,
              value: leftWidth,
              onChanged: (value) => setState(() => leftWidth = value),
            ),
            const SizedBox(
              height: 15,
            ),
            SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorTextStyle: TextStyle(color: Colors.grey)),
                child: Slider(
                  label: "Left Drawer Background Color",
                  activeColor: colorPallete[leftBackgroundColor],
                  min: 0,
                  max: colorPallete.length.toDouble() - 1.0,
                  divisions: colorPallete.length,
                  value: leftBackgroundColor.toDouble(),
                  onChanged: (value) => setState(() {
                    leftBackgroundColor = value.toInt();
                  }),
                )),
            const SizedBox(
              height: 15,
            ),
            SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorTextStyle: TextStyle(color: Colors.grey)),
                child: Slider(
                  label: "Left Drawer Label Color",
                  activeColor: colorPallete[leftTextColor],
                  min: 0,
                  max: colorPallete.length.toDouble() - 1.0,
                  divisions: colorPallete.length,
                  value: leftTextColor.toDouble(),
                  onChanged: (value) => setState(() {
                    leftTextColor = value.toInt();
                  }),
                )),
            const SizedBox(
              height: 15,
            ),
            Text("Right Width = $rightWidth"),
            Slider(
              label: "Right Drawer Width",
              activeColor: Colors.blue,
              min: 50.0,
              max: 100.0,
              divisions: 50,
              value: rightWidth,
              onChanged: (value) => setState(() => rightWidth = value),
            ),
            const SizedBox(
              height: 15,
            ),
            SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorTextStyle: TextStyle(color: Colors.grey)),
                child: Slider(
                  label: "Right Drawer Background Color",
                  activeColor: colorPallete[rightBackgroundColor],
                  min: 0,
                  max: colorPallete.length.toDouble() - 1.0,
                  divisions: colorPallete.length,
                  value: rightBackgroundColor.toDouble(),
                  onChanged: (value) => setState(() {
                    rightBackgroundColor = value.toInt();
                  }),
                )),
            const SizedBox(
              height: 15,
            ),
            SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorTextStyle: TextStyle(color: Colors.grey)),
                child: Slider(
                  label: "Right Drawer Label Color",
                  activeColor: colorPallete[rightTextColor],
                  min: 0,
                  max: colorPallete.length.toDouble() - 1.0,
                  divisions: colorPallete.length,
                  value: rightTextColor.toDouble(),
                  onChanged: (value) => setState(() {
                    rightTextColor = value.toInt();
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
