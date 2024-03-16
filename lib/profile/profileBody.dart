import 'package:flutter/material.dart';
import '../DropdownAndLeble.dart';
import '../dropdwon_button.dart';
import '../customCard.dart';
import '../update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../log_in.dart';
import 'profile.dart';

class ProfileBody extends StatefulWidget {
  final String? phoneNumber;
  final String? name;
  final String? blood;
  final Map<String, String>? logedinUserInfo;

  const ProfileBody({
    Key? key,
    this.phoneNumber,
    this.name,
    this.blood,
    this.logedinUserInfo,
  }) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  var DonateDate = "";
  var DonateMonth = "";
  var DonateYear = "";
  var DonateOffPeriod = "";
  final TextEditingController cause_of_off = TextEditingController();

  Future<void> updateDonationDate(BuildContext context, String date, String month, String year) async {
    if (date.isEmpty || month.isEmpty || year.isEmpty) {
      // Show an error dialog if any field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please provide all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Exit the method
    }

    print(widget.logedinUserInfo!['phone']);
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.logedinUserInfo!['phone']) // Assuming the document ID is the phone number
          .update({
        'lastDonationDate': date,
        'lastDonationMonth': month,
        'lastDonationYear': year,
      });

      // Show a success message
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Donation date updated successfully')),
      // );

      // Reload the page
      // Navigator.pop(context); // Pop the current page
      widget.logedinUserInfo!['lastDonationDate'] = date;
      widget.logedinUserInfo!['lastDonationMonth'] = month;
      widget.logedinUserInfo!['lastDonationYear'] = year;

      Navigator.push( // Push the page again
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Profile(
            phoneNumber: widget.phoneNumber,
            logedinUserInfo: widget.logedinUserInfo,
          ),
        ),
      );
    } catch (error) {
      print('Error updating donation date: $error');
      // Show an error message if needed
    }
  }


  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red[800],
      foregroundColor: Colors.white,
      fixedSize: Size(200, 50),
    );
    final List<String> days = List.generate(31, (index) => (index + 1).toString());
    final List<String> years = List.generate(50, (index) => (index + 2020).toString());

    final List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final List<String> offmonths = [
      '১ মাস', '২ মাস','৩ মাস','৪ মাস','৫ মাস','৬ মাস','৭ মাস','৮ মাস','৯ মাস','১০ মাস','১১ মাস','১২ মাস','২ বছর', 'সারাজীবন'
    ];

    final Map<String, String> monthMap = {
      '১ মাস': "1",
      '২ মাস': "2",
      '৩ মাস': "3",
      '৪ মাস': "4",
      '৫ মাস': "5",
      '৬ মাস': "6",
      '৭ মাস': "7",
      '৮ মাস': "8",
      '৯ মাস': "9",
      '১০ মাস': "10",
      '১১ মাস': "11",
      '১২ মাস': "12",
      '২ বছর': "24", // Assuming each year has 12 months
      'সারাজীবন': "999", // Or any other suitable value to represent indefinite period
    };



    void offDonation(BuildContext context, String offPeriod) async {
      if (DonateOffPeriod == "") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('মেসেজ'),
              content: Text('দয়া করে বন্ধ করার জন্য মেয়াদ নির্ধারণ করুন'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ঠিক আছে'),
                ),
              ],
            );
          },
        );
        return;
      }

      try {
        DateTime currentDate = DateTime.now();
        DateTime currentDateWithoutTime = DateTime(currentDate.year, currentDate.month, currentDate.day);
        // print(currentDateWithoutTime);
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.logedinUserInfo!['phone']) // Assuming the document ID is the phone number
            .update({
          'offMonth': DateTime.now().month.toString(),
          'offYear': DateTime.now().year.toString(),
          'offTime': monthMap[offPeriod],
          'offDate': DateTime.now().day.toString(),
          'cause_for_donation_of': cause_of_off.text,
        });

        // Show a success message
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Donation off updated successfully')),
        // );

        // Reload the page
        // Navigator.pop(context); // Pop the current page
        Navigator.push( // Push the page again
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Profile(
              phoneNumber: widget.phoneNumber,
              logedinUserInfo: widget.logedinUserInfo,
            ),
          ),
        );
      } catch (error) {
        print('Error updating donation off period: $error');
        // Show an error message if needed
      }
    }
    void readyDonerUpdate(BuildContext context) async {
      try {
        DateTime currentDate = DateTime.now();
        String currentDateWithoutTime = DateTime(currentDate.year, currentDate.month, currentDate.day).toString().substring(0,10);
        print(currentDateWithoutTime);
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(widget.logedinUserInfo!['phone']) // Assuming the document ID is the phone number widget.logedinUserInfo!['phone']
            .update({
          'readyDate': currentDateWithoutTime,
          'readyToDonate': 'true',
          'offTime':'0',
        });

        // Show a success message
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('updated successfully')),
        // );

        // Reload the page
        Navigator.pop(context); // Pop the current page
        Navigator.push( // Push the page again
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Profile(
              phoneNumber: widget.phoneNumber,
              logedinUserInfo: widget.logedinUserInfo,
            ),
          ),
        );
      } catch (error) {
        print('Error updating donation off period: $error');
        // Show an error message if needed
      }
    }

    void updateDonateDate(String value){
      setState(() {
        DonateDate = value;
      });
    }
    void updateDonateMonth(String value){
      setState(() {
        DonateMonth = value;
      });
    }
    void updateDonateYear(String value){
      setState(() {
        DonateYear = value;
      });
    }

    void updateDonateOffPeriod(String value){
      setState(() {
        DonateOffPeriod = value;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          bottom: 16.0,
                          left: 0.0,
                          right: 0.0,
                        ),
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "আপনার তথ্যসমূহ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(widget.logedinUserInfo?['name'] ?? ''),
                            SizedBox(height: 8.0),
                            Text("মোবাইলঃ " + (widget.logedinUserInfo?['phone'] ?? '')),
                            SizedBox(height: 8.0),
                            Text("ইমেইলঃ " + (widget.logedinUserInfo?['email'] ?? '')),
                            SizedBox(height: 8.0),
                            Text("রক্তের গ্রুপঃ " + (widget.logedinUserInfo?['bloodGroup'] ?? '')),
                            SizedBox(height: 8.0),
                            Text(
                                "সর্বশেষ রক্তদানঃ " +
                                    (widget.logedinUserInfo?['lastDonationDate'] ?? '') +
                                    "/" +
                                    (widget.logedinUserInfo?['lastDonationMonth'] ?? '') +
                                    "/" +
                                    (widget.logedinUserInfo?['lastDonationYear'] ?? '')
                            ),

                            SizedBox(height: 8.0),
                            Text("জেন্ডারঃ " + (widget.logedinUserInfo?['gender'] ?? '')),
                            SizedBox(height: 8.0),
                            Text("জন্ম তারিখঃ " +
                                (widget.logedinUserInfo?['birthDate'] ?? '') +
                                "/" +
                                (widget.logedinUserInfo?['birthMonth'] ?? '') +
                                "/" +
                                (widget.logedinUserInfo?['birthYear'] ?? '')
                            ),
                            SizedBox(height: 8.0),
                            Text("গ্রামঃ " + (widget.logedinUserInfo?['village'] ?? '')),
                            SizedBox(height: 8.0),
                            Text("ইউনিয়নঃ" + (widget.logedinUserInfo?['union'] ?? '')),
                            SizedBox(height: 8.0),
                            Text("উপজেলাঃ " + (widget.logedinUserInfo?['upazilla'] ?? '')),
                            SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => UpdateProfile(
                                    phoneNumber: widget.logedinUserInfo?['phone'],
                                    logedinUserInfo: widget.logedinUserInfo,
                                  )),
                                );
                              },
                              child: Text("আপডেট করুন"),
                              style: buttonStyle,
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogIn(),
                                  ),
                                );
                              },
                              child: Text("লগ আউট করুন করুন"),
                              style: buttonStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          bottom: 16.0,
                          left: 0.0,
                          right: 0.0,
                        ),
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "রক্তদানের তারিখ আপডেট করুন",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "শেষ রক্তদানের তারিখ ",  // Title Name
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DropdownAndLabel(
                                              label: "তারিখ",
                                              isRequired: true,
                                              items: days,
                                              placeholder: "তারিখ সিলেক্ট করুন",
                                              onChanged: updateDonateDate
                                          ),
                                          DropdownAndLabel(label: "মাস", isRequired: true, items: months, placeholder: "মাস সিলেক্ট করুন", onChanged: updateDonateMonth),
                                          DropdownAndLabel(label: "সাল", isRequired: true, items: years, placeholder: "সাল সিলেক্ট করুন", onChanged: updateDonateYear),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                updateDonationDate(context, DonateDate, DonateMonth, DonateYear);
                              },
                              child: Text("আপডেট করুন"),
                              style: buttonStyle,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          bottom: 16.0,
                          left: 0.0,
                          right: 0.0,
                        ),
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "রক্তদান বন্ধ করুন ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text("কেন বন্ধ করতে চাচ্ছেন?"),
                            Container(
                              width: 200,
                              child: TextFormField(
                                minLines: 5, // Set minLines to the desired number of lines
                                maxLines: null, // Set maxLines to null for a dynamic number of lines
                                keyboardType: TextInputType.multiline,
                                controller: cause_of_off,
                                decoration: InputDecoration(
                                  labelText: 'বন্ধ করার কারণ লিখুন...',
                                  hintText: 'Type your text here...',
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white, // Set background color
                                  filled: true, // Enable filling the background color
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text("কতো দিনের জন্য বন্ধ করতে চান?"),
                            Container(
                              width: 100,
                              child: DropDownButton(items: offmonths, onChanged: updateDonateOffPeriod),
                            ),
                            SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                offDonation(context, DonateOffPeriod);
                              },
                              child: Text("বন্ধ করুন"),
                              style: buttonStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          bottom: 16.0,
                          left: 0.0,
                          right: 0.0,
                        ),
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                              ),
                              child: Text(
                                "রেডি রক্তদাতা",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text("রেডি রক্তদাতা হতে চান ?"),
                            SizedBox(height: 4.0),
                            ElevatedButton(
                              onPressed: () {
                                readyDonerUpdate(context);
                              },
                              child: Text("আপডেট করুন"),
                              style: buttonStyle,
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
        ],
      ),
    );
  }
}
