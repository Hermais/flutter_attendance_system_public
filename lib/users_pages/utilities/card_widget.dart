import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? cardTitle;
  final Function? onTap;
  final double? cardWidth;
  final double? cardHeight;
  final Widget? cardThumbnail;
  final double? thumbnailRadius;
  final String? buttonText;
  final bool? isButtonVisible;

  const CustomCard(
      {super.key,
      this.cardTitle,
      this.onTap,
      this.cardWidth,
      this.cardHeight,
      this.cardThumbnail,
      this.thumbnailRadius, this.buttonText, this.isButtonVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Card(
        elevation: 4,
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withAlpha(200),
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: SizedBox(
            width: cardWidth ?? 400,
            height: cardHeight ?? 130,
            // Modify the container to have a default button.

            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(cardTitle ?? "Empty Card"),
                      Container(
                        height: thumbnailRadius ?? 50,
                        width: thumbnailRadius ?? 50,
                        decoration: cardThumbnail == null ? const BoxDecoration():BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2,
                              color: Colors.black38),
                          color: Theme.of(context).primaryColor.withAlpha(200),
                        ),
                        child: cardThumbnail,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Visibility(
                      visible: isButtonVisible ?? true,
                      child: TextButton(
                          onPressed: () {
                            if (onTap != null) {
                              onTap!();
                            }
                          },
                          child: Text(buttonText ?? "Go to page")),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
