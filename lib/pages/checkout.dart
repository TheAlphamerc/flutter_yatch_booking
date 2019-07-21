import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_yatch_booking/model/yatch.dart';
import 'package:flutter_yatch_booking/widget_and_style/submit_Button.dart';
import 'package:flutter_yatch_booking/widget_and_style/text_style.dart';
import 'package:scoped_model/scoped_model.dart';

class Checkout extends StatefulWidget {
  final Yatch model;
  String price = "";
  Checkout({this.model});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with TickerProviderStateMixin {
  int no = 1;
  bool masterCardEnable = true;
  bool visaEnable = false;
  AnimationController _controllerMasterCard;
  AnimationController _controllerVisaCard;
  Animation<double> _animationMasterCard;
  Animation<double> _animationVisaCard;
  @override
  void initState() {
    widget.price = widget.model.price;
    _controllerMasterCard =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animationMasterCard = Tween<double>(begin: .8, end: 1).animate(
        CurvedAnimation(parent: _controllerMasterCard, curve: Curves.easeIn));

    _controllerVisaCard =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
        _controllerVisaCard = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animationVisaCard = Tween<double>(begin: .8, end: 1).animate(
        CurvedAnimation(parent: _controllerVisaCard, curve: Curves.easeIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              IconData(
                0xeab5,
                fontFamily: 'icofont',
              ),
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Checkout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Days',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Color(0xff1a5ddd),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )),
                          onTap: () {
                            setState(() {
                              if (no > 1) {
                                --no;
                                int i = int.tryParse(widget.model.price) * no;
                                widget.price = i.toString();
                              }
                            });
                          },
                        ),
                        Text(
                          no.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        GestureDetector(
                          child: Container(
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                          onTap: () {
                            setState(() {
                              no = no + 1;
                              int i = int.tryParse(widget.model.price) * no;
                              widget.price = i.toString();
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 60,
                width: 2,
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: FractionalOffset.centerLeft,
                    width: 100,
                    child: Text(
                      '\$${widget.price}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 90,
          ),
          _middleSection(),
          SizedBox(height: 60,),
          SubmitButton(buttonText: 'Rent now',navToBack: true,)
        ],
      ),
    );
  }

  Widget _middleSection() {
    return Column(
      children: <Widget>[
        Text(
          'Payment Cards',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        Row(
          children: <Widget>[
            ScaleTransition(
              scale: _animationMasterCard,
              alignment: Alignment.center,
              child: GestureDetector(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width / 2 - 28,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: masterCardEnable
                            ? Color(0xffd1d1e1)
                            : Color(0xFFFFFFFF),
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: masterCardEnable
                        ? Color(0xff1a5ddd)
                        : Color(0xfff5f3fb),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '**** 2019',
                        style: TextStyle(
                            color:
                                masterCardEnable ? Colors.white : Colors.black),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        '\$23 890',
                        style: TextStyle(
                            color:
                                masterCardEnable ? Colors.white : Colors.black,
                            fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Platinum',
                            style: TextStyle(
                                color: masterCardEnable
                                    ? Colors.white54
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset('assets/image/masterCardLogo.png',
                              height: 25)
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    masterCardEnable = true;
                    visaEnable = false;
                    _controllerMasterCard.forward();
                    _controllerVisaCard.reverse();

                  });
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ScaleTransition(
              scale: _animationVisaCard,
              child: GestureDetector(
                child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width / 2 - 32,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: visaEnable ? Color(0xff1a5ddd) : Color(0xfff5f3fb),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: visaEnable
                              ? Color(0xffd1d1e1)
                              : Color(0xFFFFFFFF),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '**** 3456',
                          style: TextStyle(
                              color: visaEnable ? Colors.white : Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '\$15 000',
                          style: TextStyle(
                              color: visaEnable ? Colors.white : Colors.black,
                              fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Platinum',
                              style: TextStyle(
                                  color:
                                      visaEnable ? Colors.white : Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/image/visaCardLogo.png',
                                height: 15),
                          ],
                        )
                      ],
                    )),
                onTap: () {
                  setState(() {
                    visaEnable = true;
                    masterCardEnable = false;
                    _controllerMasterCard.reverse();
                    _controllerVisaCard.forward();
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  dispose() {
    _controllerMasterCard.dispose();
    super.dispose();
  }
}
