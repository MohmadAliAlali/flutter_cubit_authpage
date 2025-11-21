import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:task1_cubit/features/home/prisintation/view/home_page.dart';
import 'package:task1_cubit/features/navbar/prisintation/manager/navbar_cubit.dart';
import 'package:task1_cubit/features/profile/prisintation/view/profile_page.dart';
import 'package:task1_cubit/features/settings/data/prisintation/view/settings_page.dart';

class NavbarScreen extends StatelessWidget {
  NavbarScreen({super.key});

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _screens() {
    return [ProfilePage(), HomePage(), SettingsPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: const Color.fromARGB(255, 63, 165, 248),
        inactiveColorPrimary: const Color.fromARGB(255, 189, 188, 188),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: const Color.fromARGB(255, 63, 165, 248),
        inactiveColorPrimary: const Color.fromARGB(255, 189, 188, 188),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: const Color.fromARGB(255, 63, 165, 248),
        inactiveColorPrimary: const Color.fromARGB(255, 189, 188, 188),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavbarCubit(),
      child: BlocBuilder<NavbarCubit, int>(
        builder: (context, state) {
          return PersistentTabView(
            context,
            controller: _controller,

            screens: _screens(),
            items: _navBarsItems(),

            navBarStyle: NavBarStyle.style9, // ⭐ Style 9

            onItemSelected: (index) {
              context.read<NavbarCubit>().changeTab(index);
            },

            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            decoration: NavBarDecoration(
              // borderRadius: BorderRadius.circular(-5),
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
            ),

            confineToSafeArea: true,
            handleAndroidBackButtonPress: false,
            stateManagement: true,
            resizeToAvoidBottomInset: true,
          );
        },
      ),
    );
  }
}
