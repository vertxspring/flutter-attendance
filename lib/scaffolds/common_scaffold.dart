import 'package:attendance/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final List<DrawerItem> drawerItems;

  CommonScaffold(
      {@required this.body, @required this.title, @required this.drawerItems});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.60;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: SizedBox(
          width: drawerWidth,
          child: Drawer(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: drawerItems,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            color: Colors.amber,
            child: body,
          ),
        ));
  }
}
