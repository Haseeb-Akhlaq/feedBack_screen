import 'package:feedback_screen/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

enum CardGesture {
  agree,
  disagree,
  non,
  skip,
}

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
            Divider(thickness: 3, color: Colors.grey[300]),
            SizedBox(height: 10),
            TagsColumn(),
            SizedBox(height: 10),
            Divider(thickness: 3, color: Colors.grey[300]),
            SizedBox(height: 5),
            BillSection(),
            SizedBox(height: 15),
            Divider(thickness: 3, color: Colors.grey[300]),
            SizedBox(height: 15),
            CardsSection(),
          ],
        ),
      ),
    );
  }
}

class CardsSection extends StatefulWidget {
  @override
  _CardsSectionState createState() => _CardsSectionState();
}

class _CardsSectionState extends State<CardsSection> {
  String language = 'English';

  int cardNumber = 0;

  getter() {}

  setCards() {
    List<Card> cards = [
      Card(
          color: Color(0xfffffdeb),
          position: 0,
          index: 4,
          changeProgress: changeCardProgress),
      Card(
          color: Color(0xffeeddaf),
          position: 5,
          index: 3,
          changeProgress: changeCardProgress),
      Card(
          color: Color(0xfff1e6c9),
          position: 10,
          index: 2,
          changeProgress: changeCardProgress),
      Card(
          color: Color(0xfffcfdfc),
          position: 15,
          index: 1,
          changeProgress: changeCardProgress),
      Card(
          color: Color(0xfffffdeb),
          position: 20,
          index: 0,
          changeProgress: changeCardProgress),
    ];
    return cards;
  }

  List<CardGesture> cardProgress = [
    CardGesture.non,
    CardGesture.non,
    CardGesture.non,
    CardGesture.non,
    CardGesture.non,
  ];

  void changeCardProgress(CardGesture gesture, index) {
    setState(() {
      cardProgress.removeAt(index);
      cardProgress.insert(index, gesture);
      cardNumber = index;
    });
  }

  getColorBorder(CardGesture e) {
    if (e == CardGesture.non) {
      return Colors.grey;
    }
    if (e == CardGesture.agree) {
      return Colors.green;
    }
    if (e == CardGesture.disagree) {
      return Colors.red;
    }
    if (e == CardGesture.skip) {
      return Colors.grey;
    }
  }

  getColorIcon(CardGesture e) {
    if (e == CardGesture.non) {
      return Colors.transparent;
    }
    if (e == CardGesture.agree) {
      return Colors.green;
    }
    if (e == CardGesture.disagree) {
      return Colors.red;
    }
    if (e == CardGesture.skip) {
      return Colors.transparent;
    }
  }

  getColorCircle(CardGesture e) {
    if (e == CardGesture.non) {
      return Colors.transparent;
    }
    if (e == CardGesture.agree) {
      return Colors.green.withOpacity(0.4);
    }
    if (e == CardGesture.disagree) {
      return Colors.red.withOpacity(0.4);
    }
    if (e == CardGesture.skip) {
      return Colors.grey.withOpacity(0.4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: TextStyle(color: Colors.grey),
                          value: language,
                          onChanged: (v) {
                            setState(() {
                              language = v;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              child: Text('English'),
                              value: 'English',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: cardProgress
                        .map((e) => Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getColorCircle(e),
                                border: Border.all(color: getColorBorder(e)),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 25,
                                color: getColorIcon(e),
                              ),
                            ))
                        .toList()),
              ),
              SizedBox(height: 30),
              if (cardNumber != 4)
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.45,
                  // Important to keep as a stack to have overlay of cards.
                  child: Stack(
                    children: setCards(),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(height: 2, width: double.infinity, color: Colors.grey[300]),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.yellow),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'By Sending FeedBack, You Agree To The Privacy Policy, Term & Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Card extends StatefulWidget {
  final Color color;
  final double position;
  final int index;
  final Function changeProgress;
  Card({this.color, this.position, this.index, this.changeProgress});

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.position),
      child: Swipable(
        onSwipeLeft: (od) {
          print('left swiped');
          widget.changeProgress(CardGesture.disagree, widget.index);
          setState(() {});
        },
        onSwipeRight: (od) {
          print('left swiped');
          widget.changeProgress(CardGesture.agree, widget.index);
          setState(() {});
        },
        onSwipeUp: (od) {
          print('left swiped');
          widget.changeProgress(CardGesture.skip, widget.index);
          setState(() {});
        },
        onSwipeDown: (od) {
          print('left swiped');
          widget.changeProgress(CardGesture.skip, widget.index);
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: widget.color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'I Didnt Have To Wait Long For My Appointment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    wordSpacing: 5,
                    height: 1.5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.edit, size: 18, color: Colors.grey),
                        Text(
                          ' Suggest an edit',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.flag_outlined, size: 18, color: Colors.grey),
                        Text(
                          ' Report',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BillSection extends StatefulWidget {
  @override
  _BillSectionState createState() => _BillSectionState();
}

class _BillSectionState extends State<BillSection> {
  String currency = '\$ USD';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bill',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Transform.scale(
                scale: 0.9,
                child: Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: TextStyle(color: Colors.grey),
                        value: currency,
                        onChanged: (v) {
                          setState(() {
                            currency = v;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('\$ USD'),
                            value: '\$ USD',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Text('150.00\$', style: TextStyle(fontSize: 25)),
          Divider(thickness: 2, color: Colors.grey[300]),
          SizedBox(height: 20),
          Row(
            children: [
              Text('Hypo Tip ',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
              Icon(
                Icons.info_outline,
                color: AppColors.yellow,
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0%', style: TextStyle(fontSize: 22, color: Colors.grey)),
              Text('10%', style: TextStyle(fontSize: 22, color: Colors.grey)),
              Text('15%',
                  style: TextStyle(fontSize: 22, color: AppColors.yellow)),
              Text('20%', style: TextStyle(fontSize: 22, color: Colors.grey)),
              Text('25%', style: TextStyle(fontSize: 22, color: Colors.grey))
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.yellow.withOpacity(0.5),
            ),
            child: Text('Tip \$22.5',
                style: TextStyle(fontSize: 22, color: Colors.white)),
          )
        ],
      ),
    );
  }
}

class TagsColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Provided',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tag(text: 'Beautician', filled: true),
                  Tag(text: 'Beauty', filled: true),
                  Tag(text: 'Eyebrow Shaping', filled: false)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tag(text: 'Weave', filled: false),
                  Tag(text: '24 hrs Massage', filled: false),
                  Tag(text: 'Hair Color', filled: false)
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              SizedBox(width: 60),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.yellow.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'View More',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  final bool filled;

  const Tag({this.text, this.filled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      decoration: BoxDecoration(
          color: filled ? AppColors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 13, color: filled ? Colors.white : Colors.grey),
      ),
    );
  }
}

class ScoresRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '64',
                style: TextStyle(
                    fontSize: 25, color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Tippers',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
          Container(width: 1, height: 30, color: Colors.grey),
          SizedBox(width: 5),
          Column(
            children: [
              Text(
                '25%',
                style: TextStyle(
                    fontSize: 25, color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Avg Tip',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
          SizedBox(width: 5),
          Container(width: 1, height: 30, color: Colors.grey),
          Column(
            children: [
              Text(
                '95%',
                style: TextStyle(
                    fontSize: 25, color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Hypo Score',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

class UpperProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, 360));
            },
            blendMode: BlendMode.dstIn,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.48,
              color: AppColors.purple,
              child: Container(
                margin: EdgeInsets.only(top: 150),
              ),
            )),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset('assets/tip with feedback.png'),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    )),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  backgroundImage: NetworkImage(
                      'https://image.freepik.com/free-photo/portrait-happy-ginger-red-hair-girl-with-freckles-smiling-looking-camera-pastel-blue-background-copy-space_1258-783.jpg'),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Divanna Doe',
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                'Beautician',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
