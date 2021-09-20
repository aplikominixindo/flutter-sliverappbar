import 'package:flutter/material.dart';

class SliverappbarWithTabbar extends StatefulWidget {
  @override
  _SliverappbarWithTabbarState createState() => _SliverappbarWithTabbarState();
}

class _SliverappbarWithTabbarState extends State<SliverappbarWithTabbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: false,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Nature',
                      textScaleFactor: 1,
                    ),
                    background: Image.asset(
                      'assets/images/images_1.jpg',
                      fit: BoxFit.cover,
                    ),
                    stretchModes: [StretchMode.zoomBackground],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: MySliverPersistentHeaderDelegate(
                    TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.home),
                        ),
                        Tab(
                          icon: Icon(Icons.games),
                        ),
                        Tab(
                          icon: Icon(Icons.contact_mail),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(children: [
              Icon(
                Icons.home,
                size: 150.0,
              ),
              Icon(
                Icons.games,
                size: 150.0,
              ),
              Icon(
                Icons.contact_mail,
                size: 150.0,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this._tabBar);

  final TabBar _tabBar;

  double get minExtent => _tabBar.preferredSize.height;
  double get maxExtent => _tabBar.preferredSize.height;

  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegare) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }
}
