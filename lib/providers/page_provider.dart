import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  int _currentIndex = 0;

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();

      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
      }
    });
  }

  int getPageIndex(String routeName) {
    // ignore: prefer_contains
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  void goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
