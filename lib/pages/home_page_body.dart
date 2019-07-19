import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width - 100),
              width: 100,
              color: Color(0xfff5f3fb),
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
          top: MediaQuery.of(context).padding.top + 10, left: 25),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Icon(Icons.chevron_left),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 35),
                child: Icon(IconData(0xef0a,fontFamily: 'icofont')),
              ),
            ],
          ),
          SizedBox(
            height: 20,
            width: 2,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0),
            title: Text(
              'Yatch',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Charters',
              style: TextStyle(fontSize: 25,fontFamily: 'OpenSans'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _rotatedBox('Motor'),
                  SizedBox(
                    height: 100,
                  ),
                  _rotatedBox('Sailing'),
                  SizedBox(
                    height: 100,
                  ),
                  _rotatedBox('Motor-Sailing'),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 180,
                      child: CarouselSlider(
                        height: 370.0,
                        initialPage: 0,
                        reverse: false,
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        items: [1, 2, 3,4,5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  // decoration: BoxDecoration(color: Colors.amber),
                                  child: i == 3 || i == 2? _slideBox(
                                      'assets/image/yatch_side_$i.png', '$i')
                                      : _slideBox(
                                      'assets/image/yatch_side_$i.jpg', '$i')),
                                      onTap: (){
                                        Navigator.pushNamed(context, '/detail');
                                      },);
                            },
                          );
                        }).toList(),
                      )))
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0),
            title: Text(
              'Popular',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                _popularYatch(
                    'assets/image/yatch_side_2.png', 'Oceana Yatch', " 4,5"),
                _popularYatch(
                    'assets/image/yatch_side_1.jpg', 'Ardena Yatch', " 3,2"),
                 _popularYatch(
                    'assets/image/yatch_side_2.png', 'Oceana Yatch', " 4,5"),
                _popularYatch(
                    'assets/image/yatch_side_4.jpg', 'Ardena Yatch', " 3,2"),
                    
              ],
            ),
          )),
          // _popularYatch(
          //     'assets/image/yatch_side_2.png', 'Oceana Yatch', " 4,5"),
          // _popularYatch(
          //     'assets/image/yatch_side_1.jpg', 'Ardena Yatch', " 3,2"),
        ],
      ),
    );
  }

  Widget _rotatedBox(String text) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(text),
    );
  }

  Widget _slideBox(String img, String rupee) {
    return Container(
      margin: EdgeInsets.only(right: 5, top: 10, bottom: 20),
      padding: EdgeInsets.only(top: 20, left: 0, bottom: 20),
      width: 240,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color(0xffd1d1e1), blurRadius: 10, offset: Offset(0, 10))
      ], borderRadius: BorderRadius.circular(20), color: Color(0xff1a5ddd)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '     #yatching',
                style: TextStyle(color: Color(0xff74a4f9)),
              ),
              SizedBox(
                width: 50,
              ),
              Icon(
                Icons.favorite_border,
                color: Color(0xff74a4f9),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            img,
            height: 100,
            width: 200,
            alignment: FractionalOffset.centerLeft,
            fit: BoxFit.cover,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            title: Text(
              'Atlantica',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'Yatch',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Row(
            children: <Widget>[
              Text('     \$',
                  style: TextStyle(color: Colors.white60, fontSize: 15)),
              Text(' $rupee',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              Text(' / Day',
                  style: TextStyle(color: Colors.white60, fontSize: 15)),
            ],
          )
        ],
      ),
    );
  }

  Widget _popularYatch(String img, String name, String rating) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(
            Icons.favorite_border,
            size: 14,
          ),
          Text(rating)
        ],
      ),
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.yellow[200]),
        child: Image.asset(
          img,
          height: 50,
          width: 50,
          alignment: FractionalOffset.centerLeft,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
