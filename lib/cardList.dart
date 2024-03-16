import 'package:flutter/material.dart';
import 'CardBody.dart';
import 'CustomBottomNav.dart';
import 'CustormDrawer.dart';
import 'Home.dart';
import 'Body.dart';
import 'bottomNav.dart';
import 'important_numbers/important.dart';
import 'profile/profile.dart';
import './Home.dart';

class CardList extends StatefulWidget {
  final List<Map<String, String>> donorInfo;
  final String? phoneNumber;
  final String? userVillage;
  final Map<String, String> ? logedinUserInfo;

  const CardList({Key? key, required this.donorInfo, this.phoneNumber, this.userVillage, this.logedinUserInfo}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 1;

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CardBody(donorInfo: widget.donorInfo, phoneNumber: widget.phoneNumber, userVillage: widget.userVillage, logedinUserInfo: widget.logedinUserInfo),
      drawer: CustomDrawer(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
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
              MaterialPageRoute(builder: (context) => HomeActivity(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            ).then((_) => Navigator.of(context).pop());
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Important(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo,)),
            ).then((_) => Navigator.of(context).pop());
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(phoneNumber: widget.phoneNumber,logedinUserInfo: widget.logedinUserInfo)),
            ).then((_) => Navigator.of(context).pop());
          }
        },
      ),
    );
  }
}
