import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nawabganj_roktoseba/bloodDonate/bloodDonate.dart';
import 'package:nawabganj_roktoseba/bloodDonate/bloodDonate.dart'; // Add this import statement

class BloodDonateBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String> ? logedinUserInfo;

  const BloodDonateBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
    this.logedinUserInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Image.asset(
                    "lib/assets/photos/rokotoseba_cover.png",
                    // height: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5, top: 0, right: 5, bottom: 20),
              child: Column(
                children: [
                  Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'রক্তদানের সম্পূর্ণ বিবরণ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '১. রক্তদানের উপকারিতা:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '• অন্যান্যদের জীবন বাঁচানো',
                      ),
                      Text(
                        '• নিজের স্বাস্থ্য উন্নতি',
                      ),
                      Text(
                        '• সুস্থ প্রজন্ম পোষণ',
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '২. রক্ত দিতে পারবে কারা:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '• বয়স ১৮ বছর বা তার বেশি',
                      ),
                      Text(
                        '• স্বাস্থ্যগত ভালো অবস্থায়',
                      ),
                      Text(
                        '• পূর্বের দুটি মাসে কোন অসুস্থতা হয়ে না থাকলে',
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '৩. কখন রক্ত দেওয়া যাবেনা:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '• সর্দি, কাশি, জ্বর, ব্যাথা, বমি এবং ম্যালেরিয়া, ডেঙ্গু, চিকুনগুনিয়া, ইউক রোগীরা',
                      ),
                    ],
                  ),
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
