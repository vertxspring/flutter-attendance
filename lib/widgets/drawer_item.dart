import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String path;
  final Icon leadingIcon;
  final VoidCallback onClick;
  final bool divider;
  DrawerItem(
      {@required this.title,
      this.path,
      this.leadingIcon,
      this.onClick,
      this.divider: true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(children: <Widget>[
        ListTile(
          title: Center(child: Text(title)),
          onTap: () {
            if (onClick != null) onClick();
            if (path != null) Navigator.pushNamed(context, path);
          },
          leading: leadingIcon,
        ),
        divider
            ? Divider(
                color: Colors.white,
              )
            : Container()
      ]),
    );
  }
}
