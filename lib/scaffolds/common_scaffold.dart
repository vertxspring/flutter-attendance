import 'package:attendance/services/login_service.dart';
import 'package:attendance/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

LoginService loginService = LoginService();

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
                  child: Column(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: drawerItems,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: DrawerItem(
                              title: 'Logout',
                              onClick: () => loginService.logout(),
                              path: '/login',
                              divider: false,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            color: Colors.indigo,
            child: body,
          ),
        ));
  }
}
