import 'dart:ui';

import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // Booleans
  final bool? bordersVisible;
  final bool? isBasicTheme;
  final bool? isButtonVisible;
  final bool? isLectureCard;
  final bool? isTopLeftBorderMaxRadius;
  final bool? isTextVisible;

// Doubles
  final double? cardHeight;
  final double? cardWidth;
  final double? thumbnailRadius;
  final double? titleFontSize;
  final double? descriptionFontSize;
  final double? margin;
  final double? cardBorder;
  final double? borderRadii;

  // Integers
  final int? descriptionMaxLines;

// Strings
  final String? buttonText;
  final String? cardDescription;
  final String? cardTitle;
  final String? lectureEndsAt;
  final String? lectureStartsAt;
  final String? lecturePlace;

// Function
  final Function? onTap;
  final Function? onButtonTap;

// Widget
  final Widget? cardThumbnail;
  final BuildContext? buildContext;
  Color? cardColor;

  InfoCard(
      {super.key,
      this.bordersVisible,
      this.isBasicTheme,
      this.isButtonVisible,
      this.isLectureCard,
      this.isTopLeftBorderMaxRadius,
      this.cardHeight,
      this.thumbnailRadius,
      this.buttonText,
      this.cardDescription,
      this.cardTitle,
      this.lectureEndsAt,
      this.lectureStartsAt,
      this.onTap,
      this.cardThumbnail,
      this.lecturePlace,
      this.titleFontSize,
      this.descriptionFontSize,
      this.buildContext,
      this.margin,
      this.cardWidth,
      this.onButtonTap,
      this.descriptionMaxLines,
      this.cardColor,
      this.borderRadii, this.isTextVisible, this.cardBorder});

  InfoCard.blank(
      {super.key,
      this.bordersVisible,
      this.isBasicTheme,
      this.isButtonVisible = false,
      this.isLectureCard = false,
      this.isTopLeftBorderMaxRadius = false,
      this.cardHeight,
      this.thumbnailRadius = 40,
      this.buttonText,
      this.cardDescription,
      this.cardTitle,
      this.lectureEndsAt,
      this.lectureStartsAt,
      this.onTap,
      this.cardThumbnail,
      this.lecturePlace,
      this.titleFontSize = 18,
      this.descriptionFontSize,
      this.buildContext,
      this.margin = 0.5,
      this.cardWidth,
      this.onButtonTap,
      this.descriptionMaxLines = 1,
      this.cardColor,
      this.borderRadii=5, this.isTextVisible, this.cardBorder});

  @override
  Widget build(BuildContext context) {
    cardColor = cardColor ?? Theme.of(context).primaryColor;
    final BorderRadius borderRadius = BorderRadius.only(
        topRight:
        Radius.circular((isTopLeftBorderMaxRadius ?? true) ? 65 : (borderRadii ?? 10)),
        topLeft:  Radius.circular((borderRadii ?? 10)),
        bottomRight: Radius.circular((borderRadii ?? 10)),
        bottomLeft:  Radius.circular((borderRadii ?? 10)));


    return Padding(
      padding:  EdgeInsets.all(margin ?? 4.0),
      child: Material(
        elevation: 8,
        borderRadius:borderRadius,
        child: Container(
          margin: EdgeInsets.all(cardBorder ?? 2),
          child: InkWell(
            splashColor: cardColor!.withAlpha(200),
            borderRadius: borderRadius,
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            child: Container(
              height: cardHeight,
              width: cardWidth,
              padding: const EdgeInsets.all(6),
              decoration: (isBasicTheme ?? false)
                  ? BoxDecoration(
                      borderRadius: borderRadius,
                      border: (bordersVisible ?? false)
                          ? Border.all(width: 2, color: Colors.black38)
                          : null,
                      color: cardColor ?? cardColor!.withAlpha(50),
                    )
                  : BoxDecoration(
                      borderRadius: borderRadius,
                      boxShadow: [
                        BoxShadow(
                          color: cardColor!.withAlpha(50),
                          offset: const Offset(0, 30),
                          blurRadius: 50,
                          spreadRadius: -5,
                        ),
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            cardColor!.withAlpha(50),
                            cardColor!.withAlpha(100),
                            cardColor!.withAlpha(150),
                            cardColor!.withAlpha(150),
                          ],
                          stops: const [
                            0.1,
                            0.3,
                            0.9,
                            1.0
                          ])),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    /// flex for upper row
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: thumbnailRadius ?? 50,
                                width: thumbnailRadius ?? 50,
                                decoration: cardThumbnail == null
                                    ? null
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
                        Visibility(visible:  isTextVisible ?? true,
                          child: Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
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
                                          style: TextStyle(
                                            fontSize: titleFontSize ?? 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          cardDescription ??
                                              "This is a short description"
                                                  " of the card. This should appear if the the property "
                                                  "is set to null. The text is meant to be a little long"
                                                  " for test purposes.",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          maxLines: descriptionMaxLines ?? 5,
                                          style: TextStyle(
                                            fontSize: descriptionFontSize ??
                                                (((titleFontSize ?? 20) * 0.8)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    /// flex for lower row
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: isLectureCard ?? true,
                          child: const Divider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                        ),
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          Visibility(
                            visible: isLectureCard ?? true,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.access_time_outlined,
                                  size: 20,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  lectureStartsAt ?? "09:00AM",
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.timelapse_outlined,
                                  size: 20,
                                ),
                                const SizedBox(width: 3),
                                Text(lectureEndsAt ?? "10:30AM"),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.place_outlined,
                                  size: 20,
                                ),
                                Text(lecturePlace ?? "24408"),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Visibility(
                              visible: isButtonVisible ?? true,
                              child: TextButton(
                                  onPressed: () {
                                    if (onButtonTap != null) {
                                      onButtonTap!();
                                    }
                                  },
                                  child: Text(
                                    buttonText ?? "Go to page",
                                    style: const TextStyle(color: Colors.black38, fontWeight: FontWeight.bold
                                    ,letterSpacing: 1),
                                  )),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
