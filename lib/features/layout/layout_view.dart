import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_egypt_with_state_management/core/blocs/profile/profile_bloc.dart';
import 'package:go_egypt_with_state_management/features/favorites/favorites_view.dart';
import 'package:go_egypt_with_state_management/features/governments/views/governments_view.dart';
import 'package:go_egypt_with_state_management/features/home/views/home_view.dart';
import 'package:go_egypt_with_state_management/features/profile/views/profile_view.dart';
import 'package:go_egypt_with_state_management/generated/l10n.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = 'layout';

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeView(),
    GovernmentsView(),
    FavoritesView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: S.of(context).bottom_navigation_home,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/government_icon.png'),
            ),
            label: S.of(context).bottom_navigation_governments,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: S.of(context).bottom_navigation_favorites,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: S.of(context).bottom_navigation_profile,
          )
        ],
      ),
    );
  }
}
