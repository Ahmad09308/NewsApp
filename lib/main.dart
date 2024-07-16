// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:aa/Auth/pages/HomePage.dart';
import 'package:aa/Auth/pages/LoigIn.dart';
import 'package:aa/Auth/pages/account_page.dart';
import 'package:aa/Auth/pages/saved_page.dart';
import 'package:aa/Auth/pages/search_page.dart';
import 'package:aa/core/bloc/app_manager_bloc.dart';
import 'package:aa/core/config/bloc_observ.dart';

import 'package:aa/core/config/service_locater.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppManagerBloc()
        ..add(CheckAuthorized())
        ..add(ExcuteLastRequest()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AppManagerBloc, AppManagerState>(
          builder: (context, state) {
            switch (state) {
              case NavigateToHomePage():
                return MainScreen();
              case NavigateToOffline():
                return const OfflinePage();
              default:
                return Loigin();
            }
          },
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final _pageOptions = [
    HomePage(),
    const SearchPage(),
    SavedPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.search, size: 30),
          const Icon(Icons.bookmark, size: 30),
          const Icon(Icons.account_circle, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
            onTap: () {
              context.read<AppManagerBloc>().add(RestoreToLogIn());
            },
            child: const Text("There is No Internet")),
      ),
    );
  }
}
