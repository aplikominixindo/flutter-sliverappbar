import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SliverappbarStatus extends StatefulWidget {
  const SliverappbarStatus() : super();

  @override
  _SliverappbarStatusState createState() => _SliverappbarStatusState();
}

class _SliverappbarStatusState extends State<SliverappbarStatus> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;

  bool get _isSliverappbarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor =
              _isSliverappbarExpanded ? Colors.white : Colors.redAccent;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            // snap: true,
            floating: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Nature',
                style: TextStyle(
                  color: _textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              background: Image.asset(
                'assets/images/images_1.jpg',
                fit: BoxFit.cover,
              ),
              stretchModes: [StretchMode.zoomBackground],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100.0,
                    child: Placeholder(),
                  ),
                  title: Text(
                    'Place ${index + 1}',
                    textScaleFactor: 1,
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
