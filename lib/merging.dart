import 'package:flutter/material.dart';

class BloodDonationDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            'নবাবগঞ্জ রক্তসেবা',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'নবাবগঞ্জ রক্তসেবা একটি অত্যন্ত সম্মানজনক এবং প্রশংসনীয় সংগঠন, যা রক্তের প্রয়োজনে অসহায় মানুষের পাশে দাঁড়ানোর জন্য আবার মানুষের স্বাস্থ্য ও জীবনের জন্য অবদান রাখে। তাদের গুরুত্বপূর্ণ কাজের মধ্যে রক্তদান, রক্তের সংগ্রহ, সংরক্ষণ, পরিবহন, প্রয়োজনীয় মানুষের কাছে পৌঁছানো এবং তাদের সাথে পরিচয় করার প্রস্তুতি রয়েছে।',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'এছাড়াও, নবাবগঞ্জ রক্তসেবা বিভিন্ন সেচ্ছাসেবী কাজ করে, যেমনঃ',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '1. রক্তদান শিবির',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            '2. রক্তের পরীক্ষা ও সংরক্ষণ',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            '3. রক্তের পরিবহন',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            '4. রক্তের উপকারিতা শিবির',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            '5. রক্তের ব্যবস্থাপনা',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            'সংগঠনটি তাদের কার্যক্রমে সফলতা অর্জনের জন্য মোবাইল এপের মাধ্যমে সহায়ক হয়ে থাকে, যা মানুষের মধ্যে সচেতনতা উত্তেজনা তৈরি করে তাদেরকে রক্ত দানের প্রয়োজনীয়তা এবং তাদের সমাজের জন্য অবদানের গুরুত্ব সম্পর্কে শিক্ষা দেয়।',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'সার্বিক ভাবে, নবাবগঞ্জ রক্তসেবা সংগঠন একটি অত্যন্ত গুরুত্বপূর্ণ সংগঠন, যা মানুষের জীবন ও স্বাস্থ্য উন্নতির জন্য কাজ করে যাতে সমাজ এবং মানবিক সম্প্রেষণে একটি মানবকেন্দ্রিক পদক্ষেপ নেওয়া যায়।',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
