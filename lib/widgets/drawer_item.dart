import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String path;
  final Icon leadingIcon;
  DrawerItem({@required this.title, @required this.path, this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, path),
        leading: leadingIcon,
      ),
    );
  }
}
