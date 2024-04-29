import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/views/home/views/home_view.dart';
import 'package:insights_news/features/views/profile/profile_view.dart';
import 'package:insights_news/features/views/search/search_view.dart';
import 'package:insights_news/features/views/source/source_view.dart';


class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const SourceView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'),
              activeIcon: SvgPicture.asset('assets/home.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/search.svg'),
              activeIcon: SvgPicture.asset('assets/search.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/source.svg'),
              activeIcon: SvgPicture.asset('assets/source.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/profile.svg'),
              activeIcon: SvgPicture.asset('assets/profile.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              label: 'Home',
            ),
          ]),
    );
  }
}