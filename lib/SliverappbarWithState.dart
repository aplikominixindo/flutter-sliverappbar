import 'package:flutter/material.dart';

class SliverappbarWithState extends StatefulWidget {
  SliverappbarWithState() : super();

  @override
  _SliverappbarWithStateState createState() => _SliverappbarWithStateState();
}

class _SliverappbarWithStateState extends State<SliverappbarWithState> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              // snap: true,
              floating: true,
              expandedHeight: 250.0,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/flash_sale.png',
                  fit: BoxFit.cover,
                ),
                stretchModes: [StretchMode.zoomBackground],
              ),
              bottom: AppBar(
                title: Container(
                  height: 45.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter search term here'),
                  ),
                ),
              ),
            ),
            SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ItemTile(index);
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;
  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: Container(
          width: 50.0,
          height: 30.0,
          color: color.withOpacity(0.5),
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}
