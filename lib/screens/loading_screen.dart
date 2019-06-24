import 'package:attendance/models/user.dart';
import 'package:attendance/services/login_service.dart';
import 'package:attendance/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

LoginService loginService = LoginService();
StorageService storageService = StorageService();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkForLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: SpinKitFadingCube(
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void checkForLoggedInUser() async {
    User user = await storageService.getLoggedInUser();
    if (user == null)
      Navigator.of(context).pushNamed("/login");
    else {
      if (user.role == Role.ADMIN)
        Navigator.of(context).pushNamed("/admin");
      else
        Navigator.of(context).pushNamed("/user");
    }
  }
}
