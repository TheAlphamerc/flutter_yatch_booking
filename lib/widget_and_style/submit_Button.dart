import 'package:flutter/material.dart';

class SubmitButton extends  StatelessWidget {
  final String buttonText;
  final String navigationString;
  final bool navToBack;
  SubmitButton({this.buttonText,this.navigationString,this.navToBack});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Container(
      child: GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
        margin: EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff3b3d41)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              buttonText,
              style:
                  TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.w500,decoration: TextDecoration.none),
            ),
            Container(
                // padding: EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Icon( navToBack ?
                  IconData(
                    0xeab5,
                    fontFamily: 'icofont',
                  ) : IconData(
                    0xeaa0,
                    fontFamily: 'icofont',
                  ),
                  color: Colors.black,
                ))
          ],
        ),
      ),
      onTap: ()=>{
        if(navToBack){
          Navigator.pop(context)
          
        }
         else if(navigationString != null){
             Navigator.pushNamed(context, navigationString)
      }
      }
    
    ))
    );}
}