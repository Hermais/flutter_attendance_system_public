import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? cardTitle;
  final Function? onTap;
  final double? cardWidth;
  final double? cardHeight;

  const CustomCard(
      {super.key, this.cardTitle, this.onTap, this.cardWidth, this.cardHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Card(
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withAlpha(30),
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: SizedBox(
            width: cardWidth ?? 400,
            height: cardHeight ?? 130,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(cardTitle ?? "Empty Card"),
            ),
          ),
        ),
      ),
    );
  }
}
