import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_yatch_booking/widget_and_style/text_style.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20, left: 20,right: 20),
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
                        Text(
                          '-',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
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
                  Text(
                    '\$2000',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 80,),
          _middleSection(),
          _bottomButton()
        ],
      ),
    );
  }
  Widget _middleSection(){
    return Column(
      children: <Widget>[
       Text('Payment Cards',style: TextStyle(fontSize: 15),),
       Row(children: <Widget>[
         Container(
         height: 250,
         width: MediaQuery.of(context).size.width / 2 -30 ,
         padding: EdgeInsets.all(20),
         margin: EdgeInsets.symmetric(vertical: 30),
         decoration: BoxDecoration(
           boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color(0xffd1d1e1), blurRadius: 10, offset: Offset(0, 10),)],
           borderRadius: BorderRadius.circular(20),
           color: Color(0xff1a5ddd),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
           Text('**** 2019',style: TextStyle(color: Colors.white),),
           SizedBox(height: 70,),
           Text('\$23 890',style: TextStyle(color: Colors.white,fontSize: 25),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
            Text('Platinum',style: TextStyle(color: Colors.white54,fontSize: 18),),
            Image.asset('assets/image/masterCardLogo.png',height:25)
           ],),
           
         ],),
       ),
       SizedBox(width: 20,),
       Container(
         height: 230,
         width: MediaQuery.of(context).size.width / 2 - 30 ,
         padding: EdgeInsets.all(20),
         margin: EdgeInsets.symmetric(vertical: 30),
         decoration: BoxDecoration(
           
           borderRadius: BorderRadius.circular(20),
           color: Color(0xfff5f3fb),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
           Text('**** 3456',style: TextStyle(color: Colors.black),),
           SizedBox(height: 20,),
           Text('\$15 000',style: TextStyle(color: Colors.black,fontSize: 25),),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
            Text('Platinum',style: TextStyle(color: Colors.black,fontSize: 15),),
            Image.asset('assets/image/visaCardLogo.png',height:15),
          
           ],)
         ],)
       )
       ],)
      ],
    );
  }
  Widget _bottomButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
        margin: EdgeInsets.only(left: 0, top: 70, right: 10, bottom: 10),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff3b3d41)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Pay now',
              style:
                  TextStyle(color: Colors.white, fontSize: 25),
            ),
             Container(
                // padding: EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
      onTap: ()=>{}
    );
  }
}
