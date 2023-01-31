
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';


class PageProvider with ChangeNotifier {
  PageController pageController = PageController();

  final List<String>_pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  int currentIndex = 0;
  

  int currentPageIndex(String routeName){
    return (_pages.contains(routeName)) 
                    ? _pages.indexOf(routeName) : 0;
  }

  createPageController(String routeName){
    pageController = PageController(initialPage: currentPageIndex(routeName));
    document.title = 'Landing Page - ${_pages[currentPageIndex(routeName)]}';
    pageController.addListener(() { 
      final pageIndex = (pageController.page ?? 0).round();
      if(pageIndex != currentIndex){
        currentIndex = pageIndex;
        window.history.pushState(null, '', '#/${_pages[pageIndex]}');
        document.title = 'Landing Page - ${_pages[pageIndex]}';
      }
    });

  }


  void goTo(int index){
    // final routeName = _pages[index];
    // window.history.pushState(null, '', '#/$routeName');
    pageController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }
  
}