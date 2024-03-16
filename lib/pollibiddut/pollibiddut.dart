import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/profile/profileBody.dart';
import '../CardBody.dart';
import '../CustomBottomNav.dart';
import '../CustormDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../bottomNav.dart';
import 'pollibiddutBody.dart';
import '../Home.dart';
import '../profile/profile.dart';
import '../important_numbers/important.dart';


class Pollibiddut extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String> ? logedinUserInfo;
  const Pollibiddut({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _PollibiddutState createState() => _PollibiddutState();
}

class _PollibiddutState extends State<Pollibiddut> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 2;
  Map<String, String> userInfo = {}; // Initialize userInfo list

  void initState() {
    super.initState();
  }



  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PollibiddutBody(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
      drawer: CustomDrawer(logedinUserInfo: widget.logedinUserInfo, phoneNumber: widget.phoneNumber ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            _scaffoldKey.currentState!.openDrawer();
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeActivity(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo))
            );
          } else if (index == 2) {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Important(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            );
          }
        },
      ),
    );
  }
}
