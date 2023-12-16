import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          child: ListTile(
            leading: Icon(Icons.star),
            title: Text('Card Title'),
            subtitle: Text('Card Subtitle'),
          ),
        ),

        // =======stack==========
        Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 200.0,
              width: 200.0,
            ),
            const Positioned(
              top: 10.0,
              left: 10.0,
              child: Text('Overlay Text'),
            ),
          ],
        ),

        // ======ListView========
        SizedBox(
          height: 200,
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Album'),
              ),
              // you can Add more list items as needed
            ],
          ),
        ),

        // ========GridView=========
        SizedBox(
          height: 200,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              4,
              (index) {
                return Container(
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
            ),
          ),
        ),
        // ==== CustomScrollView ====
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text('Custom Scroll View'),
              floating: true,
              expandedHeight: 200.0,
              flexibleSpace: Placeholder(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),

        // ========SnackBar =============
        Scaffold(
          body: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a Snackbar'),
                ),
              );
            },
            child: Text('Show Snackbar'),
          ),
        )
      ],
    );
  }
}
