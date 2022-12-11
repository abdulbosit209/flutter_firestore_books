
import 'package:flutter/material.dart';
import 'package:flutter_firestore_books/ui/tabs/tabs/audio/audio.dart';
import 'package:flutter_firestore_books/ui/tabs/tabs/books/books.dart';
import 'package:flutter_firestore_books/ui/tabs/tabs/my_library/my_library.dart';
import 'package:flutter_firestore_books/ui/tabs/tabs/profile/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: screen,
        items: navbarItems,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<Widget> screen = [
    BooksScreen(),
    AudioScreen(),
    MyLibrary(),
    ProfileScreen()
  ];

  List<PersistentBottomNavBarItem> navbarItems = [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu_book_outlined),
        title: "Books",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white
    ),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.headphones_outlined),
        title: "Audiobooks",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      activeColorSecondary: Colors.white
    ),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.file_download),
        title: "MyLibrary",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white
    ),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "profile",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white
    ),
  ];
}
