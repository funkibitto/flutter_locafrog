import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  late PageController pageController;

  List<Widget> _pages = [
    TabTestView(key: UniqueKey()),
    TabTestView(key: UniqueKey()),
    TabTestView(key: UniqueKey())
  ];

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home), title: new Text('Red')),
      BottomNavigationBarItem(
        icon: new Icon(Icons.search),
        title: new Text('Blue'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline), title: Text('Yellow'))
    ];
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tab demo $_currentIndex"),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: pageChanged,
          children: _pages,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: buildBottomNavBarItems(),
        ),
      ),
    );
  }
}

class TabTestView extends StatefulWidget {
  const TabTestView({Key? key}) : super(key: key);

  @override
  _TabTestViewState createState() => _TabTestViewState();
}

class _TabTestViewState extends State<TabTestView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('@@@@@@@@@       _TabTestViewState        @@@@@@@');
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: List<Widget>.generate(
          100,
          (index) => Container(
              color: Color(Random().nextInt(0xffffffff)),
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(8),
              child: Text(
                index.toString(),
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  __KeepAliveWrapperState createState() => __KeepAliveWrapperState();
}

class __KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
