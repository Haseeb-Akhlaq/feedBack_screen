import 'package:feedback_screen/feedBackScreen.dart';
import 'package:feedback_screen/styles/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f4f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperProfileSection(),
            SizedBox(height: 10),
            Text(
              'Life is Beautiful.🔥 Be Colorful.🌈 \n                    And Be You.👑',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 25),
            ScoresRow(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Image.asset('assets/did_you_know.PNG'),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedBackScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.yellow),
                          child: Text(
                            'That\'s So Smart',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
