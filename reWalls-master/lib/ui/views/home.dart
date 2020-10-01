import 'package:provider/provider.dart';
import '../../ui/widgets/bottom_nav_bar.dart';
import '../../core/utils/theme.dart';
import 'search_page.dart';
import 'category.dart';
import 'main_page.dart';
import 'settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'for_you.dart';
import 'dart:math';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo();
  InterstitialAd myintertitial;
  InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          myintertitial..load();
        } else if (event == MobileAdEvent.closed) {
         myintertitial = buildInterstitialAd()..load();
        }
        print(event);
      },
    );
  }
 void showInterstitialAd() {
    myintertitial..show();
  }
  void showRandomInterstitialAd() {
    Random r = new Random();
    bool value = r.nextBool();

    if (value == true) {
      myintertitial..show();
    }
  }
  @override void initState() {
    // TODO: implement initState
    super.initState();
    myintertitial = buildInterstitialAd()..load();
  }
  @override
  void dispose() {
    super.dispose();
     myintertitial.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateData = Provider.of<ThemeNotifier>(context);
    final ThemeData state = stateData.getTheme();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent, //state.primaryColor,
        elevation: 0,
        title: Text(
          'Walls',
          style: state.textTheme.headline5,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white, //state.textTheme.bodyText2.color,
            ),
            onPressed: () => showSearch(
                context: context, delegate: WallpaperSearch(themeData: state)),
          )
        ],
      ),
      body: Container(
        color: state.primaryColor,
        child: PageView(
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: <Widget>[
            MainBody(),
            Category(),
            ForYou(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        unselectedColor: state.textTheme.bodyText2.color,
        onItemSelected: (index) {
          _pageController.jumpToPage(index);
        },
        selectedColor: state.accentColor,
        backgroundColor: state.primaryColor,
        showElevation: false,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.category),
            title: Text('Subreddits'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('Exact Fit'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }

  Widget oldBody(ThemeData state) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: state.primaryColor,
            elevation: 4,
            title: Text(
              'Walls',
              style: state.textTheme.headline5,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: state.accentColor),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: WallpaperSearch(themeData: state));
                },
              )
            ],
            floating: true,
            pinned: _selectedIndex == 0 ? false : true,
            snap: false,
            centerTitle: false,
          ),
        ];
      },
      body: Container(
        color: state.primaryColor,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: <Widget>[
            MainBody(),
            Category(),
            ForYou(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
