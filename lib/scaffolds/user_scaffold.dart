import 'package:attendance/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

import 'common_scaffold.dart';

class UserScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  UserScaffold({@required this.body, @required this.title});

  final List<DrawerItem> drawerItems = [
    DrawerItem(
      title: 'Title 1',
      path: '/user',
    ),
    DrawerItem(
      title: 'Title 2',
      path: '/user',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(title: title, body: body, drawerItems: drawerItems);
  }
}
