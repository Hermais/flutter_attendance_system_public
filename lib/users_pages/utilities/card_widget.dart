import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? cardTitle;
  final String? cardDescription;
  final Function? onTap;
  final double? cardHeight;
  final Widget? cardThumbnail;
  final double? thumbnailRadius;
  final String? buttonText;
  final bool? isButtonVisible;
  final bool? bordersVisible;

  const CustomCard(
      {super.key,
      this.cardTitle,
      this.onTap,
      this.cardHeight,
      this.cardThumbnail,
      this.thumbnailRadius,
      this.buttonText,
      this.isButtonVisible,
      this.bordersVisible,
      this.cardDescription});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              splashColor: Theme.of(context).primaryColor.withAlpha(200),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(65),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              onTap: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              child: Container(
                height: cardHeight ?? 130,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(65),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  border: (bordersVisible ?? false)
                      ? Border.all(width: 2, color: Colors.black38)
                      : null,
                  color: Theme.of(context).primaryColor.withAlpha(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: thumbnailRadius ?? 50,
                            width: thumbnailRadius ?? 50,
                            decoration: cardThumbnail == null
                                ? const BoxDecoration()
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: (bordersVisible ?? false)
                                        ? Border.all(
                                            width: 2, color: Colors.black38)
                                        : null,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(200),
                                  ),
                            child: cardThumbnail,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(

                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    cardTitle ?? "Card Title",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,

                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  cardDescription ??
                                      "This is a short description"
                                          " of the card. This should appear if the the property"
                                          "is set to null. The text is meant to be a little long"
                                          "for test purposes.",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
