import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_yatch_booking/model/yatch.dart';
import 'package:flutter_yatch_booking/widget_and_style/submit_Button.dart';
import 'package:flutter_yatch_booking/widget_and_style/text_style.dart';

class YatchDetail extends StatefulWidget {
  final Yatch yatch;
  YatchDetail({this.yatch});

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
                  SizedBox(height: 50,),
                  Text(
                    widget.yatch.name,
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
                              text: '\$${widget.yatch.price}',
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
                    height: 70,
                  ),
                  _rotatedBox('Length',widget.yatch.lenght),
                  SizedBox(
                    height: 20,
                  ),
                  _rotatedBox('Width',widget.yatch.height),
                  SizedBox(
                    height: 20,
                  ),
                  _rotatedBox('Draft',widget.yatch.draft),
                ],
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 50),
                    width: 180,
                    alignment: FractionalOffset.centerRight,
                    height: 520,
                    child: RotatedBox(
                      quarterTurns: 4,
                      child: Image.asset(
                        widget.yatch.detailImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          SubmitButton(buttonText: 'Pay now',navigationString: 'checkout/${widget.yatch.id}',navToBack: false,)
        
        ],
      ),
    );
  }

  Widget _rotatedBox(String text,String length) {
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
                        text: length,
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
}
