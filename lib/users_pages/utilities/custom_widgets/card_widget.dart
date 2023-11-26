import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // Booleans
  final bool? bordersVisible;
  final bool? isBasicTheme;
  final bool? isButtonVisible;
  final bool? isLectureCard;
  final bool? isTopLeftBorderMaxRadius;

// Doubles
  final double? cardHeight;
  final double? thumbnailRadius;

// Strings
  final String? buttonText;
  final String? cardDescription;
  final String? cardTitle;
  final String? lectureEndsAt;
  final String? lectureStartsAt;
  final String? lecturePlace;



// Function
  final Function? onTap;

// Widget
  final Widget? cardThumbnail;

  const InfoCard(
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
      this.lecturePlace});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
        child: IntrinsicHeight(
          child: Container(

            height: cardHeight,
            padding: const EdgeInsets.all(6),
            decoration: (isBasicTheme ?? false)
                ? BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            (isTopLeftBorderMaxRadius ?? true) ? 65 : 10),
                        topLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                        bottomLeft: const Radius.circular(10)),
                    border: (bordersVisible ?? false)
                        ? Border.all(width: 2, color: Colors.black38)
                        : null,
                    color: Theme.of(context).primaryColor.withAlpha(50),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            (isTopLeftBorderMaxRadius ?? true) ? 65 : 10),
                        topLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                        bottomLeft: const Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withAlpha(50),
                        offset: const Offset(0, 30),
                        blurRadius: 50,
                        spreadRadius: -5,
                      ),
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor.withAlpha(50),
                          Theme.of(context).primaryColor.withAlpha(100),
                          Theme.of(context).primaryColor.withAlpha(150),
                          Theme.of(context).primaryColor.withAlpha(150),
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ])),
            child: Column(
              children: [
                Expanded(
                  /// flex for upper row
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                            " of the card. This should appear if the the property "
                                            "is set to null. The text is meant to be a little long"
                                            " for test purposes.",
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
                    ],
                  ),
                ),
                Expanded(
                  /// flex for lower row
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  if (onTap != null) {
                                    onTap!();
                                  }
                                },
                                child: Text(
                                  buttonText ?? "Go to page",
                                  style: const TextStyle(color: Colors.black38),
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
    );
  }
}
