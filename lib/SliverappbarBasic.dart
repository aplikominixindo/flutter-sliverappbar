import 'package:flutter/material.dart';

class SliverappbarBasic extends StatelessWidget {
  const SliverappbarBasic() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Nature',
                textScaleFactor: 1,
              ),
              background: Image.asset(
                'assets/images/images_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.0),
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
