import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nawabganj_roktoseba/contact/contact.dart';
import 'package:nawabganj_roktoseba/contact/contact.dart'; // Add this import statement
import 'contactCard.dart';


class ContactBody extends StatelessWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String> ? logedinUserInfo;

  const ContactBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
    this.logedinUserInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> contactList = [
      {
        "name": "ফজলে রাব্বি",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
        "facebook": "https://www.facebook.com/fazle.rabbi.5",
      },
      {
        "name": "রাসেল",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "নাহিদ",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "স্মরণ",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "শিবলী",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "শিবলী",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "সোহাগ",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "শিবলী",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "শিবলী",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
      {
        "name": "জয়",
        "designation": "এডমিন",
        "address": "দোমাইল, নবাবগঞ্জ",
        "phone": "01751966891",
      },
    ];

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
                    padding: EdgeInsets.only(
                      top: 0.0,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                    ),
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0.0),
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: contactList.length,
                            itemBuilder: (context, index) {
                              final contact = contactList[index];
                              return ContactCard(
                                ContactName: contact['name'] ?? '',
                                phoneNumber: contact['phone'] ?? '',
                                desination: contact['designation'] ?? '',
                                address: contact['address'] ?? '',

                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
