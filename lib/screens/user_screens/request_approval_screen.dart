import 'package:attendance/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

import '../../services/networking_service.dart';

class RequestApprovalScreen extends StatefulWidget {
  @override
  _RequestApprovalScreenState createState() => _RequestApprovalScreenState();
}

class _RequestApprovalScreenState extends State<RequestApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            child: new Text(
              "Pick date range",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomTextFormField(
              hint: 'Reason',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            onPressed: () async {
              var response = await NetworkService().post('request-approval',
                  {"noOfDays": 23, "fromDate": "2019-12-01"});

              print(response.body);
            },
            child: Text(
              'Request Approval',
              style: TextStyle(color: Colors.indigo),
            ),
            color: Colors.white,
          )
        ],
      ),
    ));
  }
}
