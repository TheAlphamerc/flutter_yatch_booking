import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_yatch_booking/widget_and_style/text_style.dart';

class YatchDetail extends StatefulWidget {
  @override
  _YatchDetailState createState() => _YatchDetailState();
}

class _YatchDetailState extends State<YatchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xff1a5ddd),
            )
          ],
        ),
        _body()
      ],
    ));
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20, left: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.chevron_left),
              GestureDetector(
                child: Icon(
                  IconData(
                    0xeab5,
                    fontFamily: 'icofont',
                  ),
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(right: 35),
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Atlantida',
                    style: headerTextStyle,
                  ),
                  Text(
                    'Yatch',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: '\$1000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                decoration: TextDecoration.none,
                              )),
                          TextSpan(
                              text: ' / day',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                decoration: TextDecoration.none,
                              )),
                        ]),
                  ),
                  // Text(
                  //   '\$1000 / Day',
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  // ),
                  SizedBox(
                    height: 100,
                  ),
                  _rotatedBox('Motor'),
                  SizedBox(
                    height: 20,
                  ),
                  _rotatedBox('Sailing'),
                  SizedBox(
                    height: 20,
                  ),
                  _rotatedBox('Motor-Sailing'),
                ],
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 180,
                    alignment: FractionalOffset.centerRight,
                    height: 520,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset(
                        'assets/image/yatch_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          _bottomButton()
        ],
      ),
    );
  }

  Widget _rotatedBox(String text) {
    return Container(
      child: Container(
        width: 120,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: '74',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                        )),
                    TextSpan(
                        text: ' m',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        )),
                  ]),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
        margin: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff3b3d41)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Rent now',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Container(
                // padding: EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Icon(
                  IconData(
                    0xeab5,
                    fontFamily: 'icofont',
                  ),
                  color: Colors.black,
                ))
          ],
        ),
      ),
      onTap: ()=>
        Navigator.of(context).pushNamed('/checkout')
    );
  }
}
