import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget
{
  String? cardTitle;
  Function? onTap;
  double? cardWidth;
  double? cardHeight;


  CustomCard({super.key, this.cardTitle, this.onTap, this.cardWidth, this.cardHeight});




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: (){
            onTap;
          },
          child:  SizedBox(
            width: cardWidth ?? 400,
            height: cardHeight ?? 130,
            child: Container(padding: const  EdgeInsets.all(8),child: Text(cardTitle?? "Empty Card"),),
          ),
        ),
      ),
    );
  }
}