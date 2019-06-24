import 'package:attendance/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

import 'common_scaffold.dart';

class AdminScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  AdminScaffold({@required this.body, @required this.title});

  final List<DrawerItem> drawerItems = [
    DrawerItem(
      title: 'Title 1',
      path: '/admin',
    ),
    DrawerItem(
      title: 'Title 2',
      path: '/admin2',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(title: title, body: body, drawerItems: drawerItems);
  }
}
